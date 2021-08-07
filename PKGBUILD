# Maintainer: Amin Vakil <info AT aminvakil DOT com>

# Before running makepkg, you must do this (as normal user):
# curl https://getfedora.org/static/fedora.gpg | gpg --import

_pkgname=butane
pkgname=butane-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="Fedora CoreOS Config Transpiler"
arch=('aarch64' 'x86_64')
url="https://github.com/coreos/butane"
license=('Apache')
conflicts=('butane')

source_aarch64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-aarch64-unknown-linux-gnu{,.asc})
source_x86_64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-x86_64-unknown-linux-gnu{,.asc})

sha256sums_aarch64=('54289fc3a78b61e8ae33193258af4ee2c91b69d039d2de5312464df82ea2834f'
                    'SKIP')
sha256sums_x86_64=('7720bda45dd600a2409a725f48b62fb3566f7d9914d895914331dc3b65b124b1'
                   'SKIP')

validpgpkeys=('8C5BA6990BDB26E19F2A1A801161AE6945719A39')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu ${pkgdir}/usr/bin/${_pkgname}
}

