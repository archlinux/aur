# Maintainer: Nathaniel Maia <natemaia10@gmail.com>
# Contributor: Marcus Shaetzle
# Contributor: Eric Vidal <eric@obarun.org>
pkgname=kickshaw
pkgver=0.6.4
pkgrel=2
pkgdesc='A menu editor for freedesktop standard menus'
url='https://bitbucket.org/natemaia/kickshaw'
arch=('x86_64')
sha256sums=('SKIP')
license=('GPL2')
source=("git+$url.git")
makedepends=('gtk3' 'gcc')
depends=('gtk3')

build() {
  cd kickshaw/source || return
  make
}

package() {
  cd kickshaw/source || return
  install -Dm755 kickshaw $pkgdir/usr/bin/kickshaw
  install -Dm644 kickshaw.desktop $pkgdir/usr/share/applications/kickshaw.desktop

  # COPYING & README
  cd .. || return
  install -Dm644 README.md $pkgdir/usr/share/licenses/kickshaw/README.md
  install -Dm644 COPYING $pkgdir/usr/share/licenses/kickshaw/COPYING
}
