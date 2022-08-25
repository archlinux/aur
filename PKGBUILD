# Maintainer:  Marco Rubin <marco.rubin@protonmail.com>
# Contributor: WhiredPlanck

_name=EasyOCR
pkgname=python-easyocr
pkgver=1.6.0
pkgrel=4
pkgdesc="End-to-End Multi-Lingual Optical Character Recognition (OCR) Solution"
arch=("any")
url="https://github.com/JaidedAI/EasyOCR"
license=("Apache-2.0")
depends=(
    'hdf5'
    'ninja'
    'python'
    'python-bidi'
    'python-numpy'
    'python-opencv'
    'python-torchvision'
    'python-pillow'
    'python-pyaml'
    'python-pyclipper'
    'python-pytorch'
    'python-scikit-image'
    'python-scipy'
    'python-shapely'
)
makedepends=('python-setuptools')
provides=('python-easyocr')
conflicts=('python-easyocr-git')
replaces=('python-easyocr-git')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('da3434d5dad8b273c008d52893bb129293b7eafd5ae9ef8d514e583f87409dae')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
