# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ukui-notification-daemon
pkgver=1.0.3
pkgrel=1
pkgdesc="Notification daemon for the UKUI desktop"
arch=('x86_64')
license=('GPL')
url="https://github.com/ukui/ukui-notification-daemon"
groups=('ukui')
depends=('dconf' 'gsettings-qt' 'libcanberra' 'qt5-svg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ukui/ukui-notification-daemon/archive/v$pkgver.tar.gz")
sha512sums=('242aebfcd3dfd758d996d9f78d718a1f48509895d39fd553f64e57a14ce3010c236b540b415f539f0af409c113647438ea023cd80e9684f9b885670a929906e8')

build() {
  cd $pkgname-$pkgver
  qmake-qt5 PREFIX=/usr QMAKE_LFLAGS="${LDFLAGS}"
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
