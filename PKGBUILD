# Maintainer: piernov <piernov@piernov.org>

pkgname=python-spikingjelly
pkgver=0.0.0.0.12
pkgrel=1
pkgdesc="Deep learning framework for Spiking Neural Network (SNN) based on PyTorch."
arch=('any')
url="https://github.com/fangwei123456/spikingjelly"
license=('custom')
depends=('python-pytorch' 'python-matplotlib' 'python-numpy' 'python-tqdm' 'python-torchvision' 'python-scipy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/99/2d/4c57ab59a70304419f08573c5c32c90856c5666f606ebf20a4454898eee1/spikingjelly-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/fangwei123456/spikingjelly/$pkgver/requirements.txt"
	"https://raw.githubusercontent.com/fangwei123456/spikingjelly/$pkgver/LICENSE")
md5sums=('bcfd3bee7a06fe74cc26e81f5f716e40'
         '135ccabeb1656b3a1b8c9b9a5d78eecf'
         '311b12d3ec62e71d0915d183e5bb7eea')

prepare() {
  cp "$srcdir"/requirements.txt "$srcdir"/spikingjelly-$pkgver/
}

build() {
  cd "$srcdir"/spikingjelly-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/spikingjelly-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1

  install -Dm644 "$srcdir"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
