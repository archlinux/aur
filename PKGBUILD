# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
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
