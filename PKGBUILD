# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-django-compressor"
pkgver=1.5
pkgrel=1
pkgdesc="Compresses linked and inline JavaScript or CSS into single cached files"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/django_compressor"
license=("Apache")

depends=(
  "python2"
  "python2-lxml"
)

makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/d/django_compressor/django_compressor-${pkgver}.tar.gz")
md5sums=('274dd82a45ddd13e111852dd101a5924')

build() {
  cd "${srcdir}/django_compressor-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/django_compressor-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
