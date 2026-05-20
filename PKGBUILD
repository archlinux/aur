# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=cranexpr
pkgname=vapoursynth-plugin-${_plug}-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (binary release)"
arch=('x86_64')
url='https://github.com/sgt0/cranexpr'
license=('MIT')
depends=('vapoursynth>=75')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${url}/releases/download/v${pkgver}/${_plug}-x86_64-unknown-linux-gnu.zip")
sha256sums=('94cd3dd434561f62f2cc32bc44f654df4f2a65ebf36fe96f7e6006a0f0745366')

package() {
    _plugindir=$(python3 -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")
    install -Dm755 "lib${_plug}.so" "${pkgdir}${_plugindir}/lib${_plug}.so"
}
