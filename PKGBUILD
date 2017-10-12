# Maintainer: Moritz Schönherr <moritz.schoenherr@posteo.net>

pkgname='notmuch-addrlookup-c-git'
pkgver=r31.88f156d
pkgrel=1
pkgdesc="A tool to query the notmuch database for addresses. Git-Version."
url="https://github.com/aperezdc/notmuch-addrlookup-c"
license=('MIT')
depend=('notmuch')
source=("git://github.com/aperezdc/notmuch-addrlookup-c.git")
sha512sums=('SKIP')
arch=('any')
depends=('')
makedepends=('git')
conflicts=("notmuch-addrlookup-c")
provides=("notmuch-addrlookup-c")

pkgver() {
  cd "${srcdir}/notmuch-addrlookup-c" 
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {

  cd "${srcdir}/notmuch-addrlookup-c"
  make
}

package() {

  cd "${srcdir}/notmuch-addrlookup-c"

  install -D notmuch-addrlookup $pkgdir/usr/bin/notmuch-addrlookup

}

# vim:set et sw=2 sts=2 tw=80:
