# Maintainer: David Manouchehri <david@davidmanouchehri.com>

pkgname=nodejs-airchat-git
_gitname=airchat
_gitbranch=master
_gitauthor=redwire
pkgver=r333.a9c4b07
pkgrel=1
arch=('any')
pkgdesc="A beautiful, modernized, browser-based IRC client."
url="https://github.com/redwire/aIRChat"
license=('MIT')
depends=('nodejs')
sha512sums=('SKIP')
source=("git://github.com/$_gitauthor/$_gitname.git#branch=$_gitbranch")

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/" # I'm probably installing it to the wrong place.
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" "$srcdir/$_gitname/Content"
}
