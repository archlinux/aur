# Maintainer: Amin Vakil <info AT aminvakil DOT com>

# Before running makepkg, you must do this (as normal user):
# curl https://fedoraproject.org/fedora.gpg | gpg --import

_pkgname=butane
pkgname=butane-bin
pkgver=0.25.1
pkgrel=1
pkgdesc="Fedora CoreOS Config Transpiler"
arch=('aarch64' 'x86_64')
url="https://github.com/coreos/butane"
license=('Apache')
conflicts=('butane')
provides=('butane')

source_aarch64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-aarch64-unknown-linux-gnu{,.asc})
source_x86_64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-x86_64-unknown-linux-gnu{,.asc})

sha256sums_aarch64=('9e6811720ced6a3655ba16d9cd933f768d04e412de47accaecd1e584bb5bc79e'
                    'SKIP')
sha256sums_x86_64=('c9bf44bed655215384fca24c3ebf2b547965d9c522cf959e735201c5f97ea467'
                   'SKIP')

validpgpkeys=('B0F4950458F69E1150C6C5EDC8AC4916105EF944')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu ${pkgdir}/usr/bin/${_pkgname}
}
