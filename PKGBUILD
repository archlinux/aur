# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer : James Rayner <iphitus@gmail.com>
# Contributor: Roberto Salas <ro0xito@gmail.com>

pkgname=alltray
pkgver=0.7.5.1dev
pkgrel=6
pkgdesc="Drops any app in the tray."
license=('GPL')
arch=('x86_64')
url="https://github.com/mbt/alltray"
depends=('libxpm' 'libgtop' 'libwnck')
source=(https://code.launchpad.net/alltray/trunk/${pkgver}/+download/alltray-${pkgver}.tar.gz)
md5sums=('5842253b89a5943031b5a02bbd8fd4fb')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
