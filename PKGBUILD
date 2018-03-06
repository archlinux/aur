# Maintainer: Nathaniel Maia <natemaia10@gmail.com>
# Contributor: Marcus Shaetzle
# Contributor: Eric Vidal <eric@obarun.org>
pkgname=kickshaw
pkgver=0.5.24
pkgrel=1
pkgdesc='A menu editor for freedesktop standard menus'
url='https://github.com/natemaia/kickshaw'
arch=('x86_64')
sha256sums=('e47edbf0d77d7a97ce970cb7e3a14a6276b7d510a5cd2e9ac76d070c9c261fbc')
license=('GPL2')
source=("$url/archive/$pkgver.tar.gz")
makedepends=('gtk3' 'gcc')
depends=('gtk3')

build() {
  cd "kickshaw-$pkgver/source" || exit
  make
}

package() {
  cd "kickshaw-$pkgver/source" || exit
  install -Dm755 kickshaw "$pkgdir/usr/bin/kickshaw"
  install -Dm644 kickshaw.desktop "$pkgdir/usr/share/applications/kickshaw.desktop"

  # COPYING & README in license directory
  cd ../ || exit
  install -Dm644 README.md "$pkgdir/usr/share/licenses/kickshaw/README.md"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/kickshaw/COPYING"
}
