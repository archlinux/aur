# Maintainer: piernov <piernov@piernov.org>

pkgname=python-spikingjelly
pkgver=0.0.0.0.14
pkgrel=1
pkgdesc="Deep learning framework for Spiking Neural Network (SNN) based on PyTorch."
arch=('any')
url="https://github.com/fangwei123456/spikingjelly"
license=('custom')
depends=('python-pytorch' 'python-matplotlib' 'python-numpy' 'python-tqdm' 'python-torchvision' 'python-scipy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/eb/81/e74b2dad5c0d9c0df166798ab9c93091f478ca8413feca876f2935ba5940/spikingjelly-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/fangwei123456/spikingjelly/$pkgver/requirements.txt"
	"https://raw.githubusercontent.com/fangwei123456/spikingjelly/$pkgver/LICENSE")
md5sums=('8301c6d58fdc5ba0137c413aedb16e19'
         '841c5a4bf6c8079fbb5aa981875d880b'
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
