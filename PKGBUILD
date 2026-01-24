# Maintainer: Josh Holmer <jholmer.in@gmail.com>

pkgname=vapoursynth-plugin-mlrt-ext-models-swinir
pkgver=1
pkgrel=1
pkgdesc="Plugin for VapourSynth: mlrt (external models for SwinIR)"
arch=('any')
url='https://github.com/AmusementClub/vs-mlrt'
license=('MIT')
depends=('vapoursynth' 'vapoursynth-plugin-mlrt')
source=(
    "https://github.com/AmusementClub/vs-mlrt/releases/download/external-models/swinir_v1.7z"
)
sha256sums=(
    "88ccecedb2e11eacee0d2f3a70e72209d5d692696d2b9eb42a30bf7e614a0e0b"
)

package() {
  cd "swinir"

  for i in $(ls *.onnx); do install -Dm644 "${i}" "${pkgdir}/usr/lib/vapoursynth/models/swinir/${i}"; done
}
