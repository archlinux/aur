# Author: Tobias Rueetschi <tr+archlinux at brief dot li>

pkgname='nsntrace'
pkgver=3
pkgrel=2
pkgdesc="Perform network trace of a single process by using network namespaces."
arch=('i686' 'x86_64')
url="https://github.com/jonasdn/nsntrace"
license=('GPL2')
groups=()
depends=(
    'dbus'
    'docbook-xsl'
    'glibc'
    'libpcap'
    'libgcrypt'
    'libgpg-error'
    'libnl'
    'libsystemd'
    'libusb'
    'libxslt'
    'lz4'
    'xz'
)
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
md5sums=('beb4fd3b4c11df70de8dc2012a770d87')
sha256sums=('45497601e6d65e458d6d5cac52bbe4bcd303845077f7f8625666eb4e0e55ace6')

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
