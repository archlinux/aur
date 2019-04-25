# Maintainer: Sharky <sharky@sharky.pw>
pkgname=surfshark-vpn
pkgver=0.4.8
pkgrel=1
epoch=
pkgdesc="Surfshark Linux client"
arch=('x86_64')
url="https://surfshark.com/download/linux"
license=('custom:surfshark')
groups=()
depends=(glibc openvpn)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(libtool staticlibs)
install=
changelog=
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark-vpn/surfshark-vpn_${pkgver}_amd64.deb")
md5sums=('9afe5ae814038027d5c5292f5c38cce6')
sha256sums=('e76eb57b39e99c51b5307bd56ce3cff5543617c08130616aefd2a0b009a38a8d')
sha512sums=('e6879a5e958b31387ef1efe862e8a7ad5268f52178fb9b84159255360a1716a9773faefb6bc5037fd2bbad961d1257b787eed234893bcecc8d6e0bbff4971175')
noextract=()
validpgpkeys=("9337E0FFC604A322352A55606253B09AEA6AE9E1")

prepare() {
    tar xvfJ data.tar.xz
}


package() {
    mkdir -p "$pkgdir/usr/local/sbin/" "$pkgdir/usr/share/man/man8/"
    install -Dm 750 "$srcdir/usr/bin/surfshark-vpn" "$pkgdir/usr/local/sbin/" -g root -o root
    install -Dm 644 "$srcdir/usr/share/doc/surfshark-vpn/changelog.gz" "$pkgdir/usr/share/doc/changelog.gz" -o root -g root
    install -Dm 644 "$srcdir/usr/share/doc/surfshark-vpn/copyright" "$pkgdir/usr/share/doc/changelog.gz" -o root -g root
    install -Dm 644 "$srcdir/usr/share/man/man8/surfshark-vpn.8.gz" "$pkgdir/usr/share/man/man8/" -o root -g root
}
