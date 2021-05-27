_name="pytorch_wavelets"
pkgname=python-${_name}
pkgver=1.1.0
pkgrel=2
pkgdesc="2D Wavelet Transforms in Pytorch"
url="https://github.com/fbcotter/${_name}"
license=('MIT')
arch=('x86_64')
depends=('python-pytorch' 'python-pywavelets')
makedepends=('python-setuptools')
source=("https://github.com/fbcotter/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bb227ca3ddfb023af3105c5d430c8ff0e451ded0af58f7693d1321ad0215b941')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

