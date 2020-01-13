# Maintainer: willemw <willemw12@gmail.com>

pkgname=python-spyder-kernels-git
pkgver=1.8.1.r1.gb713289
pkgrel=1
pkgdesc="Jupyter Kernels for the Spyder console"
arch=('any')
url="https://github.com/spyder-ide/spyder-kernels"
license=('MIT')
depends=('python-cloudpickle' 'python-ipykernel')
makedepends=('git')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+$url.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
} 

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

