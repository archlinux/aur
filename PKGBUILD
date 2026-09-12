pkgname=audiomuse-ai-gte-model
pkgver=5.0.0
pkgrel=1
pkgdesc='GTE multilingual INT8 ONNX model and tokenizer exported for AudioMuse-AI'
arch=('any')
url='https://github.com/NeptuneHub/AudioMuse-AI'
license=('Apache-2.0')

_model_tag="v${pkgver}-model"

source=(
  "lyrics_model_gte_vnni-${pkgver}.tar.gz::https://github.com/NeptuneHub/AudioMuse-AI/releases/download/${_model_tag}/lyrics_model_gte_vnni.tar.gz"
)

sha256sums=('5f8a49c873c762f01a8da790f41f99dbdaac6f1f20d4c0a2dba407ccc60cc7cc')

noextract=(
  "lyrics_model_gte_vnni-${pkgver}.tar.gz"
)

package() {
  install -d "$pkgdir/usr/share/audiomuse-ai/gte"

  bsdtar \
    -xf "$srcdir/lyrics_model_gte_vnni-${pkgver}.tar.gz" \
    -C "$pkgdir/usr/share/audiomuse-ai/gte"
}
