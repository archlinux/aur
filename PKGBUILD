# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='vpp'
pkgname="${_pkgname}-bin"
pkgver=18.07.1
pkgrel=2
pkgdesc="FD.io Vector Packet Processing - Executables"
arch=('x86_64')
url="https://fd.io/"
license=('Apache')
depends=('vpp-lib')
provides=("${_pkgname}")
source=("https://packagecloud.io/fdio/release/packages/ubuntu/bionic/${_pkgname}_${pkgver}-release_amd64.deb/download.deb")
noextract=("download.deb")
sha256sums=('80655467795e76711d41b46cd5ca50b673d49d56f380ad5ceb9a892e847e2f15')

package() {
    bsdtar -O -xf download.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    mv "${pkgdir}/lib" "${pkgdir}/usr"
}
