# Maintainer: Amin Vakil <info AT aminvakil DOT com>

# Before running makepkg, you must do this (as normal user):
# curl https://getfedora.org/static/fedora.gpg | gpg --import

_pkgname=fcct
pkgname=fcct-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Fedora CoreOS Config Transpiler"
arch=('aarch64' 'x86_64')
url="https://github.com/coreos/fcct"
license=('Apache')
conflicts=('fcct')

source_aarch64=(https://github.com/coreos/fcct/releases/download/v$pkgver/fcct-aarch64-unknown-linux-gnu{,.asc})
source_x86_64=(https://github.com/coreos/fcct/releases/download/v$pkgver/fcct-x86_64-unknown-linux-gnu{,.asc})

sha256sums_aarch64=('c3f8b22d779ddeb685b9d8b343b1d92df70b0d078136cb01c1558d078f91023e' 'cd4c11f4c63ae146fb31214b79bdb30a7befd0f018dda4364439c018cc82ec04')
sha256sums_x86_64=('ee8d675e587be2e88eebaf23ffca49fd6973756ddbf441d3fd2e44eb9e721d75' 'dcf695f3824f517b687934ccf53e371a0767db8649bafee07dc32fbdfe862efc')

validpgpkeys=('7D22D5867F2A4236474BF7B850CB390B3C3359C4')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu ${pkgdir}/usr/bin/${_pkgname}
}

