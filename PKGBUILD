# Maintainer: Jonathan Tremesaygues <killruana@slaanesh.org>
pkgname=netgen-lvs-git
pkgver=1.5.r359.03b241a
pkgrel=1
pkgdesc="A netlist comparison (LVS) and format manipulation"
url="http://opencircuitdesign.com/netgen/"
arch=('i686' 'x86_64')
license=('GPL')
provides=('netgen-lvs')
conflicts=('netgen-lvs')
depends=()
makedepends=()
optdepends=()
source=("git://opencircuitdesign.com/netgen#branch=netgen-1.5")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-lvs-git}"

  printf "1.5.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   cd "$srcdir/${pkgname%-lvs-git}"
   ./configure --prefix=/usr
   make
}

package() {
   cd "$srcdir/${pkgname%-lvs-git}"
   make DESTDIR="$pkgdir" install
}

