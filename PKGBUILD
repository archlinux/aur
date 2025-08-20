# Maintainer: Aren <rn+aur@peacevolution.org>

pkgname=wvkbd
pkgver=0.17
pkgrel=1
pkgdesc='On-screen keyboard for wlroots'
url='https://git.sr.ht/~proycon/wvkbd'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL3')
depends=('wayland' 'pango' 'cairo' 'glibc')
makedepends=('fontconfig' 'libxkbcommon' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~proycon/wvkbd/archive/v$pkgver.tar.gz")
sha512sums=('49eaf26c634b074b18b8a9c37764fadf8d47e5be5e68fd2d5520dd09d1948cdbb9bba9c118fa699c557840c772489b8f19c3fd07090726e1c6a9dae1615ae706')

build() {
  make -C "$pkgname-v$pkgver"
}

package() {
  make -C "$pkgname-v$pkgver" PREFIX=/usr DESTDIR="$pkgdir" install
}
