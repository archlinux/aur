# Maintainer: Amin Vakil <info AT aminvakil DOT com>

# Before running makepkg, you must do this (as normal user):
# curl https://getfedora.org/static/fedora.gpg | gpg --import

_pkgname=fcct
pkgname=fcct-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Fedora CoreOS Config Transpiler"
arch=('aarch64' 'x86_64')
url="https://github.com/coreos/fcct"
license=('Apache')
conflicts=('fcct')

source_aarch64=(https://github.com/coreos/fcct/releases/download/v$pkgver/fcct-aarch64-unknown-linux-gnu{,.asc})
source_x86_64=(https://github.com/coreos/fcct/releases/download/v$pkgver/fcct-x86_64-unknown-linux-gnu{,.asc})

sha256sums_aarch64=('3c328fe3b699fad889d5e6b328cf3c06ad62201f16f71e02c1941bc126e61d8e'
                    'SKIP')
sha256sums_x86_64=('68197953fbcf23bd3d7118ae722e2a3442a454ff3d0f4c557a02fadd5449cdea'
                   'SKIP')

validpgpkeys=('963A2BEB02009608FE67EA4249FD77499570FF31')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu ${pkgdir}/usr/bin/${_pkgname}
}

