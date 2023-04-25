# Maintainer: Vasilii Novikov <n1dr+cm3513git@yaaa.ru>  (replace "aaa" with a single "a")
# Contributor: sergej@aur.archlinux.org

pkgname=slack-libpurple-git
pkgver=r369.b0453c7
pkgver() {
  cd "$srcdir/slack-libpurple/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="A purple-based (Pidgin) plugin for Slack."
url='https://github.com/dylex/slack-libpurple.git'
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git')
options=(!strip)
depends=('libpurple')
source=('slack-libpurple::git+https://github.com/dylex/slack-libpurple.git#branch=finduserhack')
sha256sums=('SKIP')

build() {
  cd "$srcdir/slack-libpurple/"
  make
}

package() {
  cd "$srcdir/slack-libpurple/"
  make DESTDIR="$pkgdir" install
}
