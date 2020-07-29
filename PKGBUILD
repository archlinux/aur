# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-django_extensions
_pkgname=django-extensions
pkgver=3.0.3
pkgrel=1
pkgdesc="Extensions for Django"
arch=("any")
url="https://github.com/django-extensions/django-extensions"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6230898b1e1d5deb3ddab8335b2d270edb7afa4ef916a95e479a19fdfb0464cb')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
