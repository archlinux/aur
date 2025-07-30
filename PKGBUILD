# Maintainer: Rongbo <wurongbo2012@hotmail.com>
pkgname=nifskope-bin
pkgver=2.0.dev11_20250630
pkgrel=1
pkgdesc="Fork of NifSkope 2.0.dev9 with many fixes and improvements."
arch=('x86_64')
url="https://github.com/fo76utils/nifskope"
license=('BSD-3-Clause')
depends=('qt6-imageformats')
makedepends=()
checkdepends=()
optdepends=(
    'qt6-tools'
)
provides=('nifskope')
source=("${url}/releases/download/v${pkgver//_/-}/NifSkope_2_0_2025-06-30-linuxqt6_x64.7z"
    "${url}/blob/develop/res/nifskope.png?raw=true"
    "NifSkope.desktop"
    "vnd.gamebryo-nif.xml"
)

sha256sums=('14b51b1a29d9ba61f237d21ebed61f24e8c4119904fa67ce91f270eae363758c'
            '27e11322eff6f06bd1f8ff9ab41cafeb9cae51a22da2796ad761d9e9b2295fe7'
            '71a7456c085f0af9e6b01c685d32f4b24e131200f97e67c1380db19d4191f4d1'
            '7931c6edab17833624ca1471f91540df5b622d1697a3c74440c344a4a0144315')

package() {
    cd ${pkgdir}
    install -Dm 755 ${srcdir}/nifskope-linux/NifSkope_noavx2 ${pkgdir}/usr/lib/nifskope/NifSkope
    install -Dm 644 -t ${pkgdir}/usr/lib/nifskope/shaders ${srcdir}/nifskope-linux/shaders/*
    install -Dm 644 ${srcdir}/nifskope-linux/*.xml ${pkgdir}/usr/lib/nifskope
    install -Dm 644 ${srcdir}/nifskope.png?raw=true ${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.niftools.NifSkope.png
    install -Dm 644 ${srcdir}/NifSkope.desktop ${pkgdir}/usr/share/applications/org.niftools.NifSkope.desktop
}

install=nifskope.install
