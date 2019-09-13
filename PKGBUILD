# Maintainer: Sharky <sharky@sharky.pw>
pkgname=surfshark-vpn
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Surfshark Linux client"
arch=('x86_64')
url="https://surfshark.com/download/linux"
license=('custom:surfshark')
depends=(glibc openvpn)
options=(libtool staticlibs)
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark-vpn/surfshark-vpn_${pkgver}_amd64.deb")
md5sums=('b4dcf2d304c8d294d622b5259d638fe0')
sha256sums=('0e11d87113bc7adfdcaa0ee2e66bebedb3f1964f897eb6552057e91282629f56')
sha512sums=('b79fd876c90c79128bdcaf11bf723a32d9ac6a44456115aa59fe536d6af168e4b0c2bc5b48da74fba553baaf056c44d3ea043d97a12f9447d16f936bf45c71c9')
noextract=()
validpgpkeys=("9337E0FFC604A322352A55606253B09AEA6AE9E1")

prepare() {
    tar xvfJ data.tar.xz
}


package() {
    mkdir -p "${pkgdir}/usr/local/sbin/"
    install -Dm 750 "${srcdir}/usr/bin/surfshark-vpn" "${pkgdir}/usr/local/sbin/" -g root -o root
    install -Dm 644 "${srcdir}/usr/share/doc/surfshark-vpn/changelog.gz" "${pkgdir}/usr/share/doc/${pkgname}/changelog.gz" -o root -g root
    install -Dm 644 "${srcdir}/usr/share/doc/surfshark-vpn/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" -o root -g root
}
