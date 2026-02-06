# Maintainer: Josh Holmer <jholmer.in@gmail.com>

pkgname=vapoursynth-plugin-mlrt-ext-models-artcnn
pkgver=1.5.2
pkgrel=1
pkgdesc="Plugin for VapourSynth: mlrt (external models for ArtCNN)"
arch=('any')
url='https://github.com/Artoriuz/ArtCNN'
license=('MIT')
depends=('vapoursynth' 'vapoursynth-plugin-mlrt')
source=("https://github.com/Artoriuz/ArtCNN/archive/refs/tags/v1.5.2.tar.gz")
sha256sums=('a3649cde98f12542620b9559c99bbd45272fa2dd03d8236e6eff3790950ad1e0')

package() {
	cd "ArtCNN-${pkgver}"

	for i in GLSL/*.glsl; do install -Dm644 "${i}" "${pkgdir}/usr/lib/vapoursynth/models/ArtCNN/$(basename "${i}")"; done
	for i in ONNX/Experiments/*.onnx; do install -Dm644 "${i}" "${pkgdir}/usr/lib/vapoursynth/models/ArtCNN/$(basename "${i}")"; done
	for i in ONNX/*.onnx; do install -Dm644 "${i}" "${pkgdir}/usr/lib/vapoursynth/models/ArtCNN/$(basename "${i}")"; done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/vapoursynth/tools/mlrt-ext-models-artcnn/README.md"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
