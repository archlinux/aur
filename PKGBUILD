# Maintainer: Wilson Birney <wpbirney@gmail.com>
_gitname=katcli
pkgname=katcli-git
pkgver=r14.7577b6e
pkgver() {
    cd "$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="command line interface for kickasstorrents"
arch=('any')
url="http://github.com/wpbirney/katcli"
license=('GPL')
groups=()
depends=('python')
makedepends=('git')
provides=('katcli')
conflicts=('katcli')
replaces=()
backup=()
options=()
install="$pkgname".install
source=('git://github.com/wpbirney/katcli')
noextract=()
md5sums=(SKIP) #generate with 'makepkg -g'

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/bin"
  cp katcli.py "$pkgdir/usr/bin/katcli"
  chmod +x "$pkgdir/usr/bin/katcli" 
}

# vim:set ts=2 sw=2 et:
