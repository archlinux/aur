# Maintainer: Josh Holmer <jholmer.in@gmail.com>

pkgname=vapoursynth-plugin-mlrt-ext-models-artcnn
pkgver=1.4.0
pkgrel=1
pkgdesc="Plugin for VapourSynth: mlrt (external models for ArtCNN)"
arch=('any')
url='https://github.com/Artoriuz/ArtCNN'
license=('MIT')
depends=('vapoursynth' 'vapoursynth-plugin-mlrt')
source=("https://github.com/Artoriuz/ArtCNN/archive/refs/tags/v1.4.0.zip")
sha256sums=('b2279343968d8902f138504b07a17411804828426442dc1dd0328ef039ccc19b')

package() {
  cd "ArtCNN-${pkgver}"

  for i in $(ls GLSL); do install -Dm644 "GLSL/${i}" "${pkgdir}/usr/lib/vapoursynth/models/ArtCNN/${i}"; done
  for i in $(ls ONNX); do install -Dm644 "ONNX/${i}" "${pkgdir}/usr/lib/vapoursynth/models/ArtCNN/${i}"; done

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/vapoursynth/tools/mlrt-ext-models-artcnn/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
