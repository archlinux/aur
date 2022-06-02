# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: WhiredPlanck

_name=EasyOCR
pkgname=python-easyocr
pkgver=1.5.0
pkgrel=3
pkgdesc="End-to-End Multi-Lingual Optical Character Recognition (OCR) Solution"
arch=("any")
url="https://github.com/JaidedAI/EasyOCR"
license=("Apache-2.0")
depends=('hdf5' 'python' 'python-numpy' 'python-opencv' 'python-torchvision' 'python-pillow'
         'python-pyaml' 'python-pytorch' 'python-scikit-image' 'python-scipy')
makedepends=('python-setuptools')
provides=('python-easyocr')
conflicts=('python-easyocr-git')
replaces=('python-easyocr-git')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b493817dbb5933da9e8cb5bae91d25779346b9c48f77e7ab1f8c02befdde9c68')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
