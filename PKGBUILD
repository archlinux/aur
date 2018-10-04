# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=dsremote-git
_pkgname=DSRemote
pkgver=r226.a7eb6a1
pkgrel=1
pkgdesc="Operate your Rigol oscilloscope from your Linux desktop."
arch=('any')
url="https://gitlab.com/Teuniz/DSRemote"
license=('GPL3')
options=('!strip')
makedepends=('git')
depends=('qt5-base')
source=("git+https://gitlab.com/Teuniz/DSRemote.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  qmake
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
}
