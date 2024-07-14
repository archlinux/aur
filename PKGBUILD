# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname='vapoursynth-previewer'
pkgver='R5'
pkgrel='1'
pkgdesc='Standalone previewer for VapourSynth scripts'
arch=('x86_64')
url='https://github.com/YomikoR/VapourSynth-Editor/tree/vse-previewer'
license=('CC-BY-2.5 AND CC-BY-3.0 AND MIT')
depends=('qt6-multimedia' 'vapoursynth>=R58')
options=('!lto')
source=("https://github.com/YomikoR/VapourSynth-Editor/archive/refs/tags/VSE-Previewer-${pkgver}.tar.gz")
sha256sums=('d9b9778965eb00c26c8a2a49d828fecd93dafcae06a909924141158299a107d8')

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
