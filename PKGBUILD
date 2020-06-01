# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>
# Contributor: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

# PKGBUILD script for git-bookmark upstream, git version
# Keep your bookmarks with your repository
_pkgname=git-bookmark
pkgname=$_pkgname-git
pkgver=0.5.1.r0.gc4ef8b4
pkgrel=1
pkgdesc="Keep your bookmarks with your repository"
arch=('any')
url="https://github.com/Qu4tro/git-bookmark"
license=('MIT')
groups=()
depends=('git' 'docopts')
makedepends=('git' 'sed' 'make')
optdepends=('ruby-ronn: Required when re-generating docs'
            'shellcheck: Required to lint the code'
            'bats-core: Required to run the test suit')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/Qu4tro/git-bookmark.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" MANDIR="/usr/local/man" install
}
