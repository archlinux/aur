# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname='dolphin-anty-bin'
pkgver=2026.70.214
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
sha256sums=('1e8470794bbd106bb9cc7e4b175e31899f485af53d713d623bf5b7ae44080ace')

pkgver() {
    strings "${_file}" | grep -m 1 'dolphin_anty-[^[:space:]]*' | cut -d- -f2-2
}

package() {
    for item in usr opt; do
        cp -a "${srcdir}/${item}" "${pkgdir}"
    done
}
