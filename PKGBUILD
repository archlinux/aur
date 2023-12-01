# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-wagtail'
_name=${pkgname#python-}
pkgver='5.2.1'
pkgrel=1
pkgdesc="A Django content management system."
url="https://wagtail.org/"
depends=('python-asgiref' 'python-beautifulsoup4' 'python-boto3' 'python-botocore' 'python-django' 'python-freezegun' 'python-importlib-metadata' 'python-jinja' 'python-markupsafe' 'python-pillow' 'python-requests' 'python-setuptools' 'python-willow')
makedepends=()
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1186b2baa74eee858f4b6b573324990f37a667c91afc439ba2651d8ac4be1a8d')

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
