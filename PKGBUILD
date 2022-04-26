# Maintainer: Aren <rn+aur@peacevolution.org>

pkgname=wvkbd
pkgver=0.7
pkgrel=1
pkgdesc='On-screen keyboard for wlroots'
url='https://github.com/jjsullivan5196/wvkbd'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL3')
depends=('wayland' 'pango')
makedepends=('fontconfig' 'libxkbcommon')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jjsullivan5196/wvkbd/archive/v$pkgver.tar.gz")
sha512sums=('06959b7de5f760d73e69429c04103a12698b75b6b8a4a49d3899ad27aa12575fea6a03492f338b2eb544ad5379bd1816ec977723c36cfe6827d06360a68fe8c7')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
