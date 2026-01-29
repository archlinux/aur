# Maintainer: Amin Vakil <info AT aminvakil DOT com>

# Before running makepkg, you must do this (as normal user):
# curl https://fedoraproject.org/fedora.gpg | gpg --import

_pkgname=butane
pkgname=butane-bin
pkgver=0.26.0
pkgrel=2
pkgdesc="Fedora CoreOS Config Transpiler"
arch=('aarch64' 'x86_64')
url="https://github.com/coreos/butane"
license=('Apache-2.0')
conflicts=('butane')
provides=('butane')

source_aarch64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-aarch64-unknown-linux-gnu{,.asc})
source_x86_64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-x86_64-unknown-linux-gnu{,.asc})

sha256sums_aarch64=('ab3712003b66fc27c76733975d1b761cd03752cf29e8bd753e8cae8be776107d'
                    'SKIP')
sha256sums_x86_64=('ae8461f5b25738c65b24e811f9f5a616b231e24e0b6e8d58871ee3eb2a7abe38'
                   'SKIP')

validpgpkeys=('C6E7F081CF80E13146676E88829B606631645531')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu ${pkgdir}/usr/bin/${_pkgname}
}
