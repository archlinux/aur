# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx-kkc
pkgver=0.1.2
pkgrel=3
pkgdesc="Fcitx Wrapper for libkkc"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-kkc"
license=('GPL')
depends=('fcitx' 'libkkc' 'libkkc-data' 'skk-jisyo' 'fcitx-qt4')
makedepends=('cmake')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('fee5bc30cd9db1f333bb8dd58658f70894e188472767e0dd08b86ee4f711395ec423b29dc5c530613af6b8c4926f2e5253e61941e69ec0eecd2db135c50e9ff5'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

build(){
  cd $pkgname-$pkgver
 
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
