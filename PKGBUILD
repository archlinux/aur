# Maintainer: Amin Vakil <info AT aminvakil DOT com>

# Before running makepkg, you must do this (as normal user):
# curl https://getfedora.org/static/fedora.gpg | gpg --import

_pkgname=fcct
pkgname=fcct-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Fedora CoreOS Config Transpiler"
arch=('aarch64' 'x86_64')
url="https://github.com/coreos/fcct"
license=('Apache')
conflicts=('fcct')

source_aarch64=(https://github.com/coreos/fcct/releases/download/v$pkgver/fcct-aarch64-unknown-linux-gnu{,.asc})
source_x86_64=(https://github.com/coreos/fcct/releases/download/v$pkgver/fcct-x86_64-unknown-linux-gnu{,.asc})

sha256sums_aarch64=('5e81603df5ffe96a0273b140d319854bf3aa2cd68b6d8322b38a015e62a8379e'
                    'SKIP')
sha256sums_x86_64=('20b368f30d00b2f5ae03d29c3955495f4eadc21245489c1bd92efbfbdf2feea1'
                   'SKIP')

validpgpkeys=('97A1AE57C3A2372CCA3A4ABA6C13026D12C944D0')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu ${pkgdir}/usr/bin/${_pkgname}
}

