# Maintainer: Matthew Murray <matt@mattmurr.xyz>
pkgname=open-fprintd
pkgver=0.4
pkgrel=2
pkgdesc="Fprintd replacement which allows you to have your own backend as a standalone service"
arch=(any)
license=(MIT)
depends=(python fprintd-clients)
makedepends=(python-setuptools)
conflicts=($pkgname)
provides=($pkgname)
url="https://github.com/uunicorn/${pkgname}"
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('c9f29fbfb0396f93b6a1013e7b78d283')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --prefix=/usr --root $pkgdir || return 1
}

# vim:set ts=2 sw=2 et:
