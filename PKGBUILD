# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: WhiredPlanck

_name=EasyOCR
pkgname=python-easyocr
pkgver=1.5.0
pkgrel=1
pkgdesc="End-to-End Multi-Lingual Optical Character Recognition (OCR) Solution"
arch=("any")
url="https://github.com/JaidedAI/EasyOCR"
license=("Apache-2.0")
depends=('python-torchvision' 'python-pytorch' 'python-scikit-image'
         'python-pillow' 'python-numpy' 'opencv' 'hdf5' 'python-scipy' 'python-pyaml')
makedepends=('python-setuptools')
provides=('python-easyocr')
conflicts=('python-easyocr-git')
replaces=('python-easyocr-git')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a2bf015dec3a4d7b8dc9536098a0c7032f3ec6477755232c8fa3b7af4cdee573')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
