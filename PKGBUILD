# Maintainer: Amin Vakil <info AT aminvakil DOT com>

# Before running makepkg, you must do this (as normal user):
# curl https://getfedora.org/static/fedora.gpg | gpg --import

_pkgname=butane
pkgname=butane-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Fedora CoreOS Config Transpiler"
arch=('aarch64' 'x86_64')
url="https://github.com/coreos/butane"
license=('Apache')
conflicts=('butane')
provides=('butane')

source_aarch64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-aarch64-unknown-linux-gnu{,.asc})
source_x86_64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-x86_64-unknown-linux-gnu{,.asc})

sha256sums_aarch64=('b3c62a6e16eb89476da1e1ded7a443705e77d67ff3f2c21ab630c75f2b35de0e'
                    'SKIP')
sha256sums_x86_64=('cb99afab1348364c97f8ccbdd60e0f69f3f9f2f86f06c74f9cd19766e7ed868b'
                   'SKIP')

validpgpkeys=('53DED2CB922D8B8D9E63FD18999F7CBF38AB71F4')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu ${pkgdir}/usr/bin/${_pkgname}
}

