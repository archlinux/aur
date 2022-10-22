pkgname=python-invisible-watermark
pkgver=0.1.5
pkgrel=1
pkgdesc='python library for invisible image watermark (blind image watermark) '
arch=(x86_64)
url='https://github.com/ShieldMnt/invisible-watermark'
license=('custom')
source=("$pkgname-$pkgver::https://github.com/ShieldMnt/invisible-watermark/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('7b4a2fa67bc4ed63136d85c7067abe432158bd897d819e0d7ef39dac3b17ed7d2e28ea138b37c3203a882ea4bc54e8cd810aa479c6b0f321ea823378c3385113')
depends=(
    'python-opencv'
    'python-pytorch'
    'python-onnx'
    'python-onnxruntime'
    'python-pillow'
    'python-pywavelets'
    'python-numpy'
)

build() {
    cd invisible-watermark-$pkgver
    python setup.py build
}

package() {
    cd invisible-watermark-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
