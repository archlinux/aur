# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Sidney Woolf <siddi.woolf@gmail.com>
pkgname=sids-dwm-git
pkgver=6.2
pkgrel=1
pkgdesc="My personal configuration of the dynamic window manager with additional patches"
arch=(x86_64 i686)
url="https://github.com/sidney-w/dwm.git"
license=('MIT')
groups=()
depends=()
makedepends=('git')
provides=(dwm)
conflicts=(dwm)
replaces=()
backup=()
options=()
install=
source=("$url")
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

_gitroot=GITURL
_gitname=MODENAME

build() {
  cd "$pkgname"
  make
}

package() {
  cd ~/sids-dwm-git/
  make DESTDIR=".config/dwm/" clean install
}

# vim:set ts=2 sw=2 et:
