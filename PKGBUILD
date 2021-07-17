# Maintainer: Amin Vakil <info AT aminvakil DOT com>

# Before running makepkg, you must do this (as normal user):
# curl https://getfedora.org/static/fedora.gpg | gpg --import

_pkgname=butane
pkgname=butane-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Fedora CoreOS Config Transpiler"
arch=('aarch64' 'x86_64')
url="https://github.com/coreos/butane"
license=('Apache')
conflicts=('butane')

source_aarch64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-aarch64-unknown-linux-gnu{,.asc})
source_x86_64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-x86_64-unknown-linux-gnu{,.asc})

sha256sums_aarch64=('3852c65c1096a9bf585eb2c56468d595d654e71172cfd21d7ea768f86b164fcf'
                    'SKIP')
sha256sums_x86_64=('527d933a6dbd0523d610ae15ad45d549168dea443c4f2fc6a8f7b41adcb2bbd4'
                   'SKIP')

validpgpkeys=('8C5BA6990BDB26E19F2A1A801161AE6945719A39')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu ${pkgdir}/usr/bin/${_pkgname}
}

