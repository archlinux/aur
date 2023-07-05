# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-wagtail'
_name=${pkgname#python-}
pkgver='5.0.2'
pkgrel=1
pkgdesc="A Django content management system."
url="https://wagtail.org/"
depends=('python-asgiref' 'python-beautifulsoup4' 'python-boto3' 'python-botocore' 'python-django' 'python-freezegun' 'python-importlib-metadata' 'python-jinja' 'python-markupsafe' 'python-pillow' 'python-requests' 'python-setuptools' 'python-willow')
makedepends=()
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('debd21df87a5db3445d65ffde12ef14e306a24f5ad490150bed556f0c8ead2bb')

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
