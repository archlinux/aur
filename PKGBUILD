# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: lh <jason52lh@gmail.com>

pkgname=fcitx-rime
pkgver=0.3.0
pkgrel=1
pkgdesc='Fcitx Wrapper for librime'
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx' "librime" "brise")
makedepends=('cmake')
install=fcitx-rime.install
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

sha512sums=('cf6f2ccaa8872c2b68fd719972662f36a09dcf27a8bea519bf0d9fdd6794e332a4e00dd0c1f2f18c503e76b658326fd56395a6bb23d782a8867ec95fb851cfc5')
