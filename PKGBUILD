# maintainer: libele <libele@disroot.org>
# contributor: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=cbonsai-git
_gitpkg=cbonsai
pkgver=1.3.1.10.g50fe627
pkgrel=1
pkgdesc='A bonsai tree generator, written in C using ncurses (git version)'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'pentium4' 'x86_64')
url="https://gitlab.com/jallbrit/cbonsai"
license=('GPL3')
depends=('ncurses')
makedepends=('scdoc')
provides=('cbonsai')
conflicts=('cbonsai')
source=('git+https://gitlab.com/jallbrit/cbonsai.git')
md5sums=(SKIP)

pkgver() {
  cd "${_gitpkg}"
  printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
}

package() {
  cd "${srcdir}"/"${_gitpkg}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
