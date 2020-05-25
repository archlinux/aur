# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-unikey
pkgver=0.2.7
pkgrel=3
pkgdesc="Fcitx Wrapper for unikey"
arch=('x86_64')
url="https://github.com/fcitx/fcitx-unikey"
license=('GPL')
depends=('fcitx')
optdepends=('fcitx-qt5: To run the fcitx unikey macro editor')
makedepends=('cmake' 'fcitx-qt5')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('1bb78e4f27f0cda1e3aa5a633be45e0a26d121d5b472b1325b0c028ff65ca156d23e7ffee0367badeac1dd21ba1743ee8a2c9c27c629ae0996e84e0062b67ad2'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
