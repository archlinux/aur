# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname='vapoursynth-previewer'
pkgver='R3'
pkgrel='1'
pkgdesc='Standalone previewer for VapourSynth scripts'
arch=('x86_64')
url='https://github.com/YomikoR/VapourSynth-Editor/tree/vse-previewer'
license=('CC-BY-2.5 AND CC-BY-3.0 AND MIT')
depends=('qt6-multimedia' 'vapoursynth>=R58')
options=('!lto')
source=("https://github.com/YomikoR/VapourSynth-Editor/archive/refs/tags/VSE-Previewer-${pkgver}.tar.gz")
sha256sums=('759afe68db327bfa93ba28f6cf1f57b5328acf6b15119ffd938958abbe236869')

build() {
    cd VapourSynth-Editor-VSE-Previewer-${pkgver}/pro

    qmake6 -norecursive vse-previewer.pro CONFIG+=release
    make
}

package() {
    cd VapourSynth-Editor-VSE-Previewer-${pkgver}

    install -Dm755 build/release-gcc/vse-previewer -t "${pkgdir}"/usr/bin/

    install -Dm644 build/release-gcc/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
