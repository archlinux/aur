# Maintainer: Amin Vakil <info AT aminvakil DOT com>

# Before running makepkg, you must do this (as normal user):
# curl https://getfedora.org/static/fedora.gpg | gpg --import

_pkgname=fcct
pkgname=fcct-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Fedora CoreOS Config Transpiler"
arch=('aarch64' 'x86_64')
url="https://github.com/coreos/fcct"
license=('Apache')
conflicts=('fcct')

source_aarch64=(https://github.com/coreos/fcct/releases/download/v$pkgver/fcct-aarch64-unknown-linux-gnu{,.asc})
source_x86_64=(https://github.com/coreos/fcct/releases/download/v$pkgver/fcct-x86_64-unknown-linux-gnu{,.asc})

sha256sums_aarch64=('2a19f392369a9123d4ebc4d7388da7f8db8e11c06318f7763404baa69713ddbc'
                    'SKIP')
sha256sums_x86_64=('8c634cd83e5a781db169641381cc19b0574d8be60589d455458b367bf541de90'
                   'SKIP')

validpgpkeys=('963A2BEB02009608FE67EA4249FD77499570FF31')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu ${pkgdir}/usr/bin/${_pkgname}
}

