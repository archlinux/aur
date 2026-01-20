# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname='dolphin-anty-bin'
pkgver=2025.351.187
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
sha256sums=('f7f8b2472014024510b99b88a830bfe3de5c9c135f0158fce7c8b7a1580c7de9')

pkgver() {
    strings "${_file}" | grep -m 1 'dolphin_anty-[^[:space:]]*' | cut -d- -f2-2
}

package() {
    for item in usr opt; do
        cp -a "${srcdir}/${item}" "${pkgdir}"
    done
}
