# Maintainer: Amin Vakil <info AT aminvakil DOT com>

# Before running makepkg, you must do this (as normal user):
# curl https://getfedora.org/static/fedora.gpg | gpg --import

_pkgname=butane
pkgname=butane-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Fedora CoreOS Config Transpiler"
arch=('aarch64' 'x86_64')
url="https://github.com/coreos/butane"
license=('Apache')
conflicts=('butane')

source_aarch64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-aarch64-unknown-linux-gnu{,.asc})
source_x86_64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-x86_64-unknown-linux-gnu{,.asc})

sha256sums_aarch64=('e0450bd2a29d26b58711f64432cae55f38313e7389d09d3e4723fb5b26162b74'
                    'SKIP')
sha256sums_x86_64=('6577ea0bd645be3af45559e19a068bf42556fe031b837340cc3c62f4d40591c7'
                   'SKIP')

validpgpkeys=('963A2BEB02009608FE67EA4249FD77499570FF31')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu ${pkgdir}/usr/bin/${_pkgname}
}

