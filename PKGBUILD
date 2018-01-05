# $Id: PKGBUILD 273597 2017-12-10 16:17:07Z heftig $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartek Iwaniec <hash87 [at] gmail [dot] com>

pkgname=synce-sync-engine
pkgver=0.16
pkgrel=3
pkgdesc="SynCE sync-engine"
arch=(any)
license=('GPL')
url="http://www.synce.org/"
depends=(synce-core synce-rra librtfcomp python2-dbus python2-gobject2 python2-lxml)
makedepends=(python2-setuptools)
install=${pkgname}.install
source=(http://downloads.sourceforge.net/synce/${pkgname}-${pkgver}.tar.gz)
md5sums=('92a9b81cba6c820f2639c50d79b6fd0d')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  python2 setup.py install --root="$pkgdir"
}
