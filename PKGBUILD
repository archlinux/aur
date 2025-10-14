# Maintainer: Damian Höster <damian.hoester@posteo.de>

pkgname=vapoursynth-plugin-mlrt-ext-models-waifu2x_swin_unet
pkgver=5
pkgrel=1
pkgdesc='Plugin for VapourSynth: mlrt (external Swin-Unet models for Waifu2x)'
arch=(any)
url=https://github.com/nagadomi/nunif
license=(MIT)
depends=(vapoursynth-plugin-mlrt)
source=(https://github.com/AmusementClub/vs-mlrt/releases/download/external-models/waifu2x_swin_unet_v5.7z)
sha256sums=(5552e225bd8370cfa84605cba6d22c6d6b854f04f38c69e435a9d2130009bcab)

package() {
  cd waifu2x
  for file_ in swin_unet_*/*.onnx; do
    install -Dm644 $file_ "$pkgdir"/usr/lib/vapoursynth/models/waifu2x/$file_
  done
}
