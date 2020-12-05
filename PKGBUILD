# Maintainer: Amin Vakil <info AT aminvakil DOT com>

# Before running makepkg, you must do this (as normal user):
# curl https://getfedora.org/static/fedora.gpg | gpg --import

_pkgname=fcct
pkgname=fcct-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Fedora CoreOS Config Transpiler"
arch=('aarch64' 'x86_64')
url="https://github.com/coreos/fcct"
license=('Apache')
conflicts=('fcct')

source_aarch64=(https://github.com/coreos/fcct/releases/download/v$pkgver/fcct-aarch64-unknown-linux-gnu{,.asc})
source_x86_64=(https://github.com/coreos/fcct/releases/download/v$pkgver/fcct-x86_64-unknown-linux-gnu{,.asc})

sha256sums_aarch64=('4574ecd48f4e4d613f92e57614e077402410b566a0ee99f67c342f6c2685ba80'
                    'SKIP')
sha256sums_x86_64=('addef5c6b620afda41f4646ce0447a31e84e3e7f7ab0745828de9b38a083bc17'
                   'SKIP')

validpgpkeys=('963A2BEB02009608FE67EA4249FD77499570FF31')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu ${pkgdir}/usr/bin/${_pkgname}
}

