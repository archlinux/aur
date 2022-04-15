# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: WhiredPlanck

_name=EasyOCR
pkgname=python-easyocr
pkgver=1.4.2
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
sha256sums=('ead4df03a61e07def7aeee04e27f8a13a393ef98acc80da790100c687fb033bb')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
