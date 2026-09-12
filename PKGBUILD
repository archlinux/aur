pkgname=audiomuse-ai-neural-fingerprint
pkgver=5.0.0
pkgrel=1
pkgdesc='Neural fingerprint model and matching AudioMuse-AI product-quantization codebook'
arch=('any')
url='https://github.com/NeptuneHub/AudioMuse-AI'
license=('AGPL-3.0-only')

_model_tag="v${pkgver}-model"

source=(
  "neural_fingerprint-${pkgver}.onnx::https://github.com/NeptuneHub/AudioMuse-AI/releases/download/${_model_tag}/neural_fingerprint.onnx"
  "neural_fingerprint_pq-${pkgver}.npz::https://github.com/NeptuneHub/AudioMuse-AI/releases/download/${_model_tag}/neural_fingerprint_pq.npz"
)

sha256sums=('b65814daa7da7d7c3de894250936db6e4363f78bd41e310f4597ddc9b46f295b'
            '88b1a66fde39a416874c5181e8e484235f621a5dc6370f05595910e0a333ec3a')

package() {
  install -Dm644 \
    "$srcdir/neural_fingerprint-${pkgver}.onnx" \
    "$pkgdir/usr/share/audiomuse-ai/neural-fingerprint/neural_fingerprint.onnx"

  install -Dm644 \
    "$srcdir/neural_fingerprint_pq-${pkgver}.npz" \
    "$pkgdir/usr/share/audiomuse-ai/neural-fingerprint/neural_fingerprint_pq.npz"
}
