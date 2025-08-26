# Maintainer: Rongbo <wurongbo2012@hotmail.com>
pkgname=nifskope-bin
pkgver=2.0.dev11_20250824
pkgrel=1
pkgdesc="Opening and editing the NetImmerse file format (NIF)."
arch=('x86_64')
url="https://github.com/fo76utils/nifskope"
license=('BSD-3-Clause')
depends=('qt6-imageformats')
makedepends=('xdg-utils')
checkdepends=()
optdepends=(
    'qt6-tools'
)
provides=('nifskope')
source=("${url}/releases/download/v${pkgver//_/-}/NifSkope_2_0_2025-08-24-linuxqt6_x64.7z"
    "${url}/blob/develop/res/nifskope.png?raw=true"
    "NifSkope.desktop"
    "vnd.gamebryo-nif.xml"
    "nifskope.install"
)

sha256sums=('549fd47a5decfaf4fa587e6f5f0b430c7aea33a97edb4c93e61b88b1cc646267'
            '27e11322eff6f06bd1f8ff9ab41cafeb9cae51a22da2796ad761d9e9b2295fe7'
            '71a7456c085f0af9e6b01c685d32f4b24e131200f97e67c1380db19d4191f4d1'
            '8295c3826e1b764f2049b94c10e51b4ca1eb4094844675a001e25d2ab512d976'
            '8ae3733e56a8a16a17dbdb0003c5c7673bd52847f04e0d55b716922e7e6b0391')

package() {
    install -Dm 644 vnd.gamebryo-nif.xml ${pkgdir}/usr/share/nifskope/vnd.gamebryo-nif.xml
    install -Dm 755 ${srcdir}/nifskope-linux/NifSkope_noavx2 ${pkgdir}/usr/lib/nifskope/NifSkope
    install -Dm 644 -t ${pkgdir}/usr/lib/nifskope/shaders ${srcdir}/nifskope-linux/shaders/*
    install -Dm 644 ${srcdir}/nifskope-linux/*.xml ${pkgdir}/usr/lib/nifskope
    install -Dm 644 ${srcdir}/nifskope.png?raw=true ${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.niftools.NifSkope.png
    install -Dm 644 ${srcdir}/NifSkope.desktop ${pkgdir}/usr/share/applications/org.niftools.NifSkope.desktop
}

install=nifskope.install
