# Maintainer: piernov <piernov@piernov.org>

pkgname=python-spikingjelly-git
pkgver=r1782.55d05d5
pkgrel=1
pkgdesc="Deep learning framework for Spiking Neural Network (SNN) based on PyTorch."
arch=('any')
url="https://github.com/fangwei123456/spikingjelly"
license=('custom')
conflicts=('python-spikingjelly')
provides=('python-spikingjelly')
depends=('python-pytorch' 'python-matplotlib' 'python-numpy' 'python-tqdm' 'python-torchvision' 'python-scipy')
makedepends=('python-setuptools')
source=("git+https://github.com/fangwei123456/spikingjelly.git")
md5sums=('SKIP')


pkgver() {
  cd "$srcdir"/spikingjelly
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/spikingjelly
  python setup.py build
}

package() {
  cd "$srcdir"/spikingjelly
  python setup.py install --root="$pkgdir"/ --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
