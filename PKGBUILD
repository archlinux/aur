# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=cranexpr
pkgname=vapoursynth-plugin-${_plug}-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (binary release)"
arch=('x86_64')
url='https://github.com/sgt0/cranexpr'
license=('MIT')
depends=('vapoursynth>=75')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${url}/releases/download/v${pkgver}/${_plug}-x86_64-unknown-linux-gnu.zip")
sha256sums=('e695f9ec51f723de943c1fb589345f97ae53049aa6f1ebd7762865d764f4c01f')

package() {
    _plugindir=$(python3 -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")
    install -Dm755 "lib${_plug}.so" "${pkgdir}${_plugindir}/lib${_plug}.so"
}
