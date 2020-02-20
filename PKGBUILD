# Maintainer: Nobbele <realnobbele@gmail.com>

pkgname=synthv-editor
pkgver=108
pkgrel=1
pkgdesc="Synthesizer V at the Forefront of Singing Synth"
arch=("x86_64")
url=https://synthesizerv.com/download
license=(custom)
depends=()
provides=("synthesizerv")
conflicts=("synthesizerv")
source=("https://s3-ap-northeast-1.amazonaws.com/synthesizerv-download/synthv-editor.zip"
        "synthesizer-v-editor.sh")
sha256sums=("SKIP"
            "SKIP")

build() {
  chmod +x "${srcdir}/synthv-editor/synthesizer-v-editor"
}

package() {
  install -d "${pkgdir}/opt/synthv-editor"
  cp -r "${srcdir}/synthv-editor/." "${pkgdir}/opt/synthv-editor"

  install -Dm755 "${srcdir}/synthesizer-v-editor.sh" "${pkgdir}/usr/bin/synthesizer-v-editor"
}
