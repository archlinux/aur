# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>

pkgname=xwingridselect
_gitname=xwingridselect
pkgver=2020.6.27
pkgrel=1
pkgdesc="X11 window switcher with fancy look"
url="https://github.com/TheCynicalTeam/xwingridselect"
arch=('i686' 'x86_64')
license=('GNU General Public License v3.0')
depends=('gtk2' 'gtk-engines' 'gtk-engine-murrine')
makedepends=('cmake' 'git' 'make')
options=(!libtool strip)

source=('git+https://github.com/TheCynicalTeam/xwingridselect.git')
md5sums=('SKIP')

build() {
  cd $_gitname
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DWITH_SCRIPTS=ON "$srcdir/$_gitname"
  make || return 1
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}
