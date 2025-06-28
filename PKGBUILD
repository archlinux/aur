# Maintainer: BryanLiang <liangrui.ch at gmail dot com>

pkgname=plantuml-native-bin
pkgver=1.2025.4
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
options=(!debug !strip)
source=("${url}/releases/download/v${pkgver}-native/plantuml-full-linux-amd64-${pkgver}.zip")
sha256sums=('e74a7320d3db213eb17073d852a977a13e1942cabd340dbff01a48cb6c05d887')

package() {
    install -dm755 "${pkgdir}/usr/lib/plantuml-native"

    find . -type f -exec cp --preserve=mode {} "${pkgdir}/usr/lib/plantuml-native"/ \;

    install -dm755 "${pkgdir}/usr/bin"

    ln -sf /usr/lib/plantuml-native/plantuml-full "${pkgdir}/usr/bin/plantuml-native"
}
