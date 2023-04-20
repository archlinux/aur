# Maintainer: Amin Vakil <info AT aminvakil DOT com>

# Before running makepkg, you must do this (as normal user):
# curl https://fedoraproject.org/fedora.gpg | gpg --import

_pkgname=butane
pkgname=butane-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="Fedora CoreOS Config Transpiler"
arch=('aarch64' 'x86_64')
url="https://github.com/coreos/butane"
license=('Apache')
conflicts=('butane')
provides=('butane')

source_aarch64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-aarch64-unknown-linux-gnu{,.asc})
source_x86_64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-x86_64-unknown-linux-gnu{,.asc})

sha256sums_aarch64=('256eb88c972a0727e40c819872428fdae4aa49795fc72737667b096005fccb06'
                    'SKIP')
sha256sums_x86_64=('d1ee3b194ad7f7fc7069243db85c7606a6cca60237860cd1108342331eecff8c'
                   'SKIP')

validpgpkeys=('ACB5EE4E831C74BB7C168D27F55AD3FB5323552A')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu ${pkgdir}/usr/bin/${_pkgname}
}

