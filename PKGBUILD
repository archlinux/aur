# Maintainer: Josh Holmer <jholmer.in@gmail.com>

pkgname=vapoursynth-plugin-mlrt-ext-models-artcnn
pkgver=1.3.0
pkgrel=1
pkgdesc="Plugin for VapourSynth: mlrt (external models for ArtCNN)"
arch=('any')
url='https://github.com/Artoriuz/ArtCNN'
license=('MIT')
depends=('vapoursynth' 'vapoursynth-plugin-mlrt')
source=("https://github.com/Artoriuz/ArtCNN/archive/refs/tags/v1.3.0.zip")
sha256sums=('7ba1066e53fbc8fdb8afc3b30b7b1ed75357483beb6e8c9bfdb0387984a94470')

package() {
  cd "ArtCNN-${pkgver}"

  for i in $(ls GLSL); do install -Dm644 "GLSL/${i}" "${pkgdir}/usr/lib/vapoursynth/models/ArtCNN/${i}"; done
  for i in $(ls ONNX); do install -Dm644 "ONNX/${i}" "${pkgdir}/usr/lib/vapoursynth/models/ArtCNN/${i}"; done

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/vapoursynth/tools/mlrt-ext-models-artcnn/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
