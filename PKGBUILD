# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname='dolphin-anty-bin'
pkgver=2026.29.196
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
sha256sums=('ef28e8f0c668b724398b1b794ee6d80858e5709bd30cdd70c1c1c86afa9313ba')

pkgver() {
    strings "${_file}" | grep -m 1 'dolphin_anty-[^[:space:]]*' | cut -d- -f2-2
}

package() {
    for item in usr opt; do
        cp -a "${srcdir}/${item}" "${pkgdir}"
    done
}
