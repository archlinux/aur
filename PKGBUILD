# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx-kkc
pkgver=0.1.4
pkgrel=2
pkgdesc="Fcitx Wrapper for libkkc"
arch=('x86_64')
url="https://github.com/fcitx/fcitx-kkc"
license=('GPL')
depends=('fcitx' 'libkkc' 'libkkc-data' 'skk-jisyo' 'fcitx-qt5')
makedepends=('cmake')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('75931031e05789b755a0fcb82f689d04084427c4ec2171e82ecffff7143c0f8d55f8d11e21b28d3e1befcef7a036e44eca5dd57c340ca5a11cb1358bc6c461ae'
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
