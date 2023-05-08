# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-wagtail'
_name=${pkgname#python-}
pkgver='5.0'
pkgrel=1
pkgdesc="A Django content management system."
url="https://wagtail.org/"
depends=('python-asgiref' 'python-beautifulsoup4' 'python-django' 'python-freezegun' 'python-importlib-metadata' 'python-jinja' 'python-markupsafe' 'python-pillow' 'python-requests' 'python-setuptools' 'python-willow')
makedepends=()
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('cb283fb558a0c94be1685eec23f8bff653f1dfafde96fbf38376782c54502e5b')

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
