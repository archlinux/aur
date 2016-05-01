# Maintainer: Ruben Van Boxem <vanboxem.ruben@gmail.com>
pkgname=stack-client-bin
pkgver=2.1.0
pkgrel=1
epoch=
pkgdesc="The STACK Client provides file sync to desktop clients."
arch=('x86_64')
url='https://www.transip.nl/stack/'
license=('unknown')
groups=()
depends=('qtkeychain')
makedepends=()
checkdepends=()
optdepends=()
provides=(stack-client)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
changelog=
source_x86_64=("http://mirror.transip.net/stack/software/deb/Ubuntu_15.10/amd64/libstacksync0_${pkgver}-${pkgrel}.1_amd64.deb"
               "http://mirror.transip.net/stack/software/deb/Ubuntu_15.10/amd64/stack-client_${pkgver}-${pkgrel}.1_amd64.deb")
noextract=('libstacksync0_${pkgver}-${pkgrel}.1_amd.deb')
sha512sums_x86_64=('09d31af6df717a6180236b8db550e6674e58167b26e40e5ee3a5dd95df67bc4fb639057779092b0535cef63354b41fd962883fda42ed297dedb58e3d1d142e0c'
                   '9d3b45dcc1970d7301e51f9211a30f64eb42d018cefcec9c6a9bcdb0135df54b92e166c2238a81b03f1d3cb182c91eac38cc4d55541ad831025ad46f854425f1')

validpgpkeys=()

prepare() {
    tar -xf data.tar.xz
    ar -xf "libstacksync0_${pkgver}-${pkgrel}.1_amd64.deb"
    tar -xf data.tar.xz
}

#build() {
#}

package() {
    rm -rf ${srcdir}/usr/share/lintian
    mv ${srcdir}/usr/lib/x86_64-linux-gnu/* ${srcdir}/usr/lib/
    ln -s /usr/lib/stack/libocsync.so.0 ${srcdir}/usr/lib/libocsync.so.0
    mv ${srcdir}/usr/ ${srcdir}/etc/ ${pkgdir}/
#	cd "$pkgname-$pkgver"
#	make DESTDIR="$pkgdir/" install
}
