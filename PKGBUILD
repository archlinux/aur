# Maintainer: Abdó Roig-Maranges <abdo.roig@gmail.com>

pkgname=git-remote-hg-git
pkgver=r285.f050de1
pkgrel=1
epoch=2
provides=("git-remote-hg")
conflicts=("git-remote-hg")
pkgdesc="Transparent bidirectional bridge between Git and Mercurial"
arch=('any')
url="https://github.com/mnauw/git-remote-hg"
license=('GPL2')
depends=('git' 'mercurial')
makedepends=('asciidoc')
source=("git+https://github.com/mnauw/git-remote-hg.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/git-remote-hg"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd "$srcdir/git-remote-hg"
  make all doc
}

package () {
  cd "$srcdir/git-remote-hg"
  make prefix=/usr DESTDIR="$pkgdir" install install-doc
}

# vim:set ts=2 sw=2 et:
