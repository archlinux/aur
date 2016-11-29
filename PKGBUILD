# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-django-haystack
_pkgname=django-haystack
pkgver=2.5.1
pkgrel=1
pkgdesc='Modular search for Django.'
arch=(any)
url=http://haystacksearch.org/
license=(BSD)
depends=(python-django)
makedepends=(python-setuptools)
source=("https://github.com/toastdriven/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('cb89cc9c9c6778a5c0e6e5b8672d4cc0')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
