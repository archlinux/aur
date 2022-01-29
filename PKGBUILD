# Maintainer: Amin Vakil <info AT aminvakil DOT com>

# Before running makepkg, you must do this (as normal user):
# curl https://getfedora.org/static/fedora.gpg | gpg --import

_pkgname=butane
pkgname=butane-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Fedora CoreOS Config Transpiler"
arch=('aarch64' 'x86_64')
url="https://github.com/coreos/butane"
license=('Apache')
conflicts=('butane')
provides=('butane')

source_aarch64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-aarch64-unknown-linux-gnu{,.asc})
source_x86_64=(https://github.com/coreos/butane/releases/download/v$pkgver/butane-x86_64-unknown-linux-gnu{,.asc})

sha256sums_aarch64=('2038749a694c561e9f4ddc04bd17d50c6fd0eb5c758e51af7c1ed914b9e98cd5'
                    'SKIP')
sha256sums_x86_64=('9ab287b2c0d54bf8b3a142ea9e1d6266d790e3353732180b470075dbc147aeef'
                   'SKIP')

validpgpkeys=('787EA6AE1147EEE56C40B30CDB4639719867C58F')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu ${pkgdir}/usr/bin/${_pkgname}
}

