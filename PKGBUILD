# Author: Tobias Rueetschi <tr+archlinux at brief dot li>

pkgname='nsntrace'
pkgver=2
pkgrel=1
pkgdesc="Perform network trace of a single process by using network namespaces."
arch=('i686' 'x86_64')
url="https://github.com/jonasdn/nsntrace"
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
source=(https://github.com/jonasdn/nsntrace/archive/v${pkgver}.tar.gz)
noextract=()
md5sums=('0507285701ab20df08e99aa4458c32b0')
sha256sums=('a77bfdccebacb9f668d793792b4ab06973fdc4177c748064b54ef04c4f36c7ee')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}/" install
}
