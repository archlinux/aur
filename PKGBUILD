# Author: Tobias Rueetschi <tr+archlinux at brief dot li>

pkgname='nsntrace'
pkgver=v1
pkgrel=1
pkgdesc="Perform network trace of a single process by using network namespaces."
arch=('i686' 'x86_64')
url="https://github.com/jonasdn/nsntrace.git"
license=('GPL2')
groups=()
depends=('libnl')
makedepends=('automake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/jonasdn/nsntrace/archive/${pkgver}.tar.gz)
noextract=()
md5sums=('6731a86c8bd499a0ec8a89be12221e83')
sha256sums=('47cc61418d14b2b00b7e2a21271816ac3b469b38f800e3ab8ca360c9a8562cbf')

build() {
    cd "$srcdir/$pkgname"

    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"

    make DESTDIR="$pkgdir/" install
}
