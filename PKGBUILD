# Maintainer: Milk Brewster <milk on freenode>
_pkgname=raysession
pkgname=${_pkgname}-git
pkgver=r286.2168a84
pkgrel=1
pkgdesc="Session manager for audio programs using the Non Session Manager (NSM) API"
arch=(x86_64)
url="https://github.com/Houston4444/RaySession"
license=('GPL')
groups=()
depends=('python-pyqt5' 'qt5-tools' 'python-pyliblo')
makedepends=('git')
provides=('raysession' 'raysession-git')
conflicts=('raysession' 'raysession-git')
install=
source=('git+https://github.com/Houston4444/RaySession')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/RaySession"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/RaySession"
}

build() {
  cd "$srcdir/RaySession"
	make
}

package() {
  cd "$srcdir/RaySession"
	 make PREFIX=/usr DESTDIR="$pkgdir/" install
}
