# Maintainer: Milk Brewster <milk on freenode>
_pkgname=patroneo
pkgname=${_pkgname}-git
pkgver=r91.0ed1640
pkgrel=1
pkgdesc="Easy Pattern Sequencer - Utilizing Jack Midi and the Non Session Manager"
arch=(x86_64)
url="https://github.com/diovudau/Patroneo"
license=('GPL')
groups=()
depends=('python' 'calfbox-git' 'python-pyqt5')
makedepends=('git')
optdepends=('non-sessionmanager: required to run Patroneo'
            'raysession-git: alternative to non-sessionmanager')
provides=('patroneo' 'patroneo-git')
conflicts=('patroneo' 'patroneo-git')
install=
source=('git+https://github.com/diovudau/patroneo')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/patroneo"

  # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/patroneo"
}

build() {
  cd "$srcdir/patroneo"
}

package() {
  cd "$srcdir/"
	# make PREFIX=/usr DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/lib
  cp -r patroneo $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/bin
  ln -s $pkgdir/usr/lib/patroneo $pkgdir/usr/bin/patroneo
}
