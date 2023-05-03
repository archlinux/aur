# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-reqif'
_name=${pkgname#python-}
pkgver='0.0.36'
pkgrel=1
pkgdesc="Python library for ReqIF format. ReqIF parsing and unparsing."
url="https://github.com/strictdoc-project/reqif"
depends=('python-jinja' 'python-toml' 'python-lxml' 'python-beautifulsoup4')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a74c730a248af9e4511c2360b46eb7d2f4f333e83c912d965ad416baa1be9c4e')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	#install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}


