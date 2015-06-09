# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=("python2-django-appconf-kilo")
pkgver="1.0.1"
pkgrel="1"
pkgdesc="A helper class for handling configuration defaults of packaged Django apps gracefully."
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/django-appconf"
license=("BSD")
makedepends=("python2" "python2-setuptools")
source=("https://pypi.python.org/packages/source/d/django-appconf/django-appconf-$pkgver.tar.gz")
sha1sums=('f25751fe513ae680b3016fef964d83c2da819932')

build() {
  cd "$srcdir/django-appconf-$pkgver"
  python2 setup.py build
}

package() {
  depends=("python2-django-kilo")

  cd "$srcdir/django-appconf-$pkgver"
  python2 setup.py install --prefix="/usr" --root="$pkgdir"
}
