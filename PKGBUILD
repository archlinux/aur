# Maintainer: Amin Vakil <info AT aminvakil DOT com>

# Before running makepkg, you must do this (as normal user):
# curl https://fedoraproject.org/fedora.gpg | gpg --import

_pkgname=butane
pkgname=butane-bin
pkgver=0.27.0
pkgrel=1
pkgdesc="Fedora CoreOS Config Transpiler"
arch=('aarch64' 'x86_64')
url="https://github.com/coreos/butane"
license=('Apache-2.0')
conflicts=('butane')
provides=('butane')

source_aarch64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-aarch64-unknown-linux-gnu{,.asc})
source_x86_64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-x86_64-unknown-linux-gnu{,.asc})

sha256sums_aarch64=('6bd1a82d23ee2f4603601579d6e0eec5834d17ee92e4ac3de4dfdec778f12a0a'
                    'SKIP')
sha256sums_x86_64=('4691b2618e94e67bb5ad2d8954bb2a414f670b83e8a39b76faae42f3c1a879fe'
                   'SKIP')

validpgpkeys=('C6E7F081CF80E13146676E88829B606631645531')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu ${pkgdir}/usr/bin/${_pkgname}
}
