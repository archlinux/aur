# Maintainer: Josh Holmer <jholmer.in@gmail.com>

pkgname=vapoursynth-plugin-mlrt-ext-models-artcnn
pkgver=1.5.0
pkgrel=1
pkgdesc="Plugin for VapourSynth: mlrt (external models for ArtCNN)"
arch=('any')
url='https://github.com/Artoriuz/ArtCNN'
license=('MIT')
depends=('vapoursynth' 'vapoursynth-plugin-mlrt')
source=("https://github.com/Artoriuz/ArtCNN/archive/refs/tags/v1.5.0.tar.gz")
sha256sums=('00c31295fe7c89f4819129518c19196cea4d24976a555de713ab4049faeb9066')

package() {
	cd "ArtCNN-${pkgver}"

	for i in GLSL/*.glsl; do install -Dm644 "${i}" "${pkgdir}/usr/lib/vapoursynth/models/ArtCNN/$(basename "${i}")"; done
	for i in ONNX/Experiments/*.onnx; do install -Dm644 "${i}" "${pkgdir}/usr/lib/vapoursynth/models/ArtCNN/$(basename "${i}")"; done
	for i in ONNX/*.onnx; do install -Dm644 "${i}" "${pkgdir}/usr/lib/vapoursynth/models/ArtCNN/$(basename "${i}")"; done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/vapoursynth/tools/mlrt-ext-models-artcnn/README.md"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
