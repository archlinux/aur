# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname='dolphin-anty-bin'
pkgver=2026.147.225
pkgrel=1
pkgdesc='Antidetect browser for multi-accounting'
arch=('x86_64')
url='https://dolphin-anty.net/'
license=('custom:Proprietary')
options=(!strip)
provides=('dolphin-anty')
makedepends=('binutils' 'grep' 'coreutils')

_file="${pkgname%-*}-${pkgver}.rpm"

source=("${_file}::https://dolphin-anty-cdn.com/anty-app/dolphin-anty-linux-x86_64-latest.rpm")
sha256sums=('e8c5de3881d4008face9e729d681af2dbe9a7f1e2753f5592ff2a4b2e70bf0c6')

pkgver() {
    strings "${_file}" | grep -m 1 'dolphin_anty-[^[:space:]]*' | cut -d- -f2-2
}

package() {
    for item in usr opt; do
        cp -a "${srcdir}/${item}" "${pkgdir}"
    done
}
