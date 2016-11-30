# Maintainer: Masoud <mpoloton@gmail.com>

pkgname=('python-gimmik')
pkgver=2.1
pkgrel=1
pkgdesc="Generator of Matrix Multiplication Kernels - GiMMiK - is a tool for generation of high performance matrix multiplication kernel code for various accelerator platforms."
arch=('any')
url="https://github.com/vincentlab/GiMMiK"
license=('BSD')
makedepends=('python-setuptools')
source=("https://github.com/vincentlab/GiMMiK/archive/v${pkgver}.tar.gz")
depends=( 'python-numpy>=1.8'
	  'python-mako>=1.0.0' )

optdepends=()
            
sha256sums=('ed8d90e99ff13b5dd796709abc42f880e3022af98591ed8254aa3e0f89b9bc0e')


build() {
  msg "Building GiMMiK"
  cd "$srcdir/GiMMiK-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/GiMMiK-${pkgver}"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

