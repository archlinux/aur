# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-reqif'
_name=${pkgname#python-}
pkgver='0.0.19'
pkgrel=1
pkgdesc="Python library for ReqIF format. ReqIF parsing and unparsing."
url="https://github.com/strictdoc-project/reqif"
depends=('python-jinja' 'python-toml' 'python-lxml' 'python-beautifulsoup4')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b3a71a15a7f4f706ff7f6946ee3ed290bb4ea203870d24efd65650ff9363d771')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}


