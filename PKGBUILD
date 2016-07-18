# Author: Tobias Rueetschi <tr+archlinux at brief dot li>

pkgname='nsntrace'
pkgver=0.0.1
pkgrel=1
pkgdesc="Perform network trace of a single process by using network namespaces."
arch=('i686' 'x86_64')
url="https://github.com/jonasdn/nsntrace.git"
license=('GPL2')
groups=()
depends=('libnl')
makedepends=('git' 'automake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/jonasdn/nsntrace.git)
noextract=()
md5sums=()

build() {
    cd "$pkgname-$pkgver"

    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"

    make DESTDIR="$pkgdir/" install
}
