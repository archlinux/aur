# Maintainer: BryanLiang <liangrui.ch at gmail dot com>

pkgname=plantuml-native-bin
pkgver=1.2025.3
pkgrel=1
pkgdesc='Generate diagrams from textual description. (native image version)'
arch=('x86_64')
url='https://github.com/plantuml/plantuml'
license=('GPL-3.0-or-later OR LGPL-3.0-or-later')
depends=(
    glibc
    alsa-lib
    libx11
    libxext
    libxi
    libxrender
    libxtst
    zlib
)
provides=('plantuml')
conflicts=('plantuml')
options=(!debug !strip)
source=("${url}/releases/download/v${pkgver}-native/plantuml-full-linux-amd64-${pkgver}.zip")
sha256sums=('176cb51de0b035bcdf0bf72c7f263444fd42e1bbfeeb5c4fd462fa9831a67f11')

package() {
    install -dm755 "${pkgdir}/usr/lib/plantuml-native"

    find . -type f -exec cp --preserve=mode {} "${pkgdir}/usr/lib/plantuml-native"/ \;

    install -dm755 "${pkgdir}/usr/bin"

    ln -sf /usr/lib/plantuml-native/plantuml-full "${pkgdir}/usr/bin/plantuml"
}
