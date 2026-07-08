# Maintainer: Amin Vakil <info AT aminvakil DOT com>

# Before running makepkg, you must do this (as normal user):
# curl https://fedoraproject.org/fedora.gpg | gpg --import

_pkgname=butane
pkgname=butane-bin
pkgver=0.29.0
pkgrel=1
pkgdesc="Fedora CoreOS Config Transpiler"
arch=('aarch64' 'x86_64')
url="https://github.com/coreos/butane"
license=('Apache-2.0')
conflicts=('butane')
provides=('butane')

source_aarch64=("${_pkgname}-${pkgver}-linux-aarch64::$url/releases/download/v$pkgver/butane-aarch64-unknown-linux-gnu"
                "${_pkgname}-${pkgver}-linux-aarch64.asc::$url/releases/download/v$pkgver/butane-aarch64-unknown-linux-gnu.asc")
source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64::$url/releases/download/v$pkgver/butane-x86_64-unknown-linux-gnu"
               "${_pkgname}-${pkgver}-linux-x86_64.asc::$url/releases/download/v$pkgver/butane-x86_64-unknown-linux-gnu.asc")

sha256sums_aarch64=('12c1d78eeffc72dab9c8383d9b79d7d6e6e0d6ec6fe8f19eaf93d9e13eef286f'
                    'SKIP')
sha256sums_x86_64=('53a20d820fbaa7fda4f1afd1814974badc8e448db4c151d3f1ba005dc29bc4c9'
                   'SKIP')

validpgpkeys=('36F612DCF27F7D1A48A835E4DBFCF71C6D9F90A6')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${pkgver}-linux-${CARCH} ${pkgdir}/usr/bin/${_pkgname}
}
