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

sha256sums=('SKIP'
    'SKIP'
    '4272b3c3d9ba9ecffcf8144ea376053fbb2e7546c09727ebd95061443a3781e1'
    'SKIP'
)

package() {
    cd ${pkgdir}
    install -Dm 755 ${srcdir}/nifskope-linux/NifSkope_noavx2 ${pkgdir}/usr/lib/nifskope/NifSkope
    install -Dm 644 -t ${pkgdir}/usr/lib/nifskope/shaders ${srcdir}/nifskope-linux/shaders/*
    install -Dm 644 ${srcdir}/nifskope-linux/*.xml ${pkgdir}/usr/lib/nifskope
    install -Dm 644 ${srcdir}/nifskope.png?raw=true ${pkgdir}/usr/share/icons/hicolor/128x128/apps/NifSkope.png
    install -Dm 644 ${srcdir}/NifSkope.desktop ${pkgdir}/usr/share/applications/NifSkope.desktop
}

install=nifskope.install
