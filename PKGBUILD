# Maintainer: Aren <rn+aur@peacevolution.org>

pkgname=wvkbd
pkgver=0.8.2
pkgrel=1
pkgdesc='On-screen keyboard for wlroots'
url='https://github.com/jjsullivan5196/wvkbd'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL3')
depends=('wayland' 'pango')
makedepends=('fontconfig' 'libxkbcommon')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jjsullivan5196/wvkbd/archive/v$pkgver.tar.gz")
sha512sums=('2915df4bc2264cd7b615fb7b339111070c07209436798fc26b46f995a3531ab3869fa1ff03491649789a6cb7ae616c8a74421893e233cf2bb1d10c06faeb0bfd')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
