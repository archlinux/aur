# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-reqif'
_name=${pkgname#python-}
pkgver='0.0.32'
pkgrel=1
pkgdesc="Python library for ReqIF format. ReqIF parsing and unparsing."
url="https://github.com/strictdoc-project/reqif"
depends=('python-jinja' 'python-toml' 'python-lxml' 'python-beautifulsoup4')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('6638001d79a8d2219d1acccfedc5576654fb1613718fa35e05f449595ac97c9b')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	#install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}


