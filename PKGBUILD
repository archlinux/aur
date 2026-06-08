# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=cranexpr
pkgname=vapoursynth-plugin-${_plug}-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (binary release)"
arch=('x86_64')
url='https://github.com/sgt0/cranexpr'
license=('MIT')
depends=('vapoursynth>=75')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}-v${pkgver}.zip::${url}/releases/download/v${pkgver}/${_plug}-x86_64-unknown-linux-gnu.zip")
sha256sums=('53860ee4aa4692a875333e44df0063bc9e62ab0b9b1cf616054b54cfe671f40a')

package() {
    _plugindir=$(python3 -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")
    install -Dm755 "lib${_plug}.so" "${pkgdir}${_plugindir}/lib${_plug}.so"
}
