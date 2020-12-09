# Maintainer: Martchus <martchus@gmx.net>

pkgname=qt6ct
pkgver=0.2
pkgrel=4
pkgdesc='Qt 6 Configuration Utility'
arch=(x86_64)
url='https://github.com/trialuser02/qt6ct'
license=(BSD)
depends=(qt6-svg)
makedepends=(qt6-tools)
source=("https://github.com/trialuser02/qt6ct/releases/download/$pkgver/qt6ct-$pkgver.tar.xz")
sha256sums=('e3f064071d45e59e4eaaf0f2b789351edc5b676874d98d3bd2abfed6230422ee')

build() {
  cd $pkgname-$pkgver
  /usr/lib/qt6/bin/qmake PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
