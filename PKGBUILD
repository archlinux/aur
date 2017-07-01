# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com
# Contributor: Thermionix <thermionix at gmail dot com>

pkgname=navit
pkgver=0.5.0
pkgrel=2
pkgdesc="Modular turn-by-turn car navigation system"
arch=('x86_64' 'i686')
url="http://www.navit-project.org/"
license=('GPL')
depends=('dbus-glib' 'gpsd' 'gtk2' 'imlib2' 'sdl_image')
makedepends=('cmake' 'libxslt')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/navit-gps/navit/archive/v$pkgver.tar.gz)
sha256sums=('13353481d7fc01a4f64e385dda460b51496366bba0fd2cc85a89a0747910e94d')

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DLIBDIR=lib -DSAMPLE_MAP=FALSE
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
