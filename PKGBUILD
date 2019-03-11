# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=python-mxboard
pkgver=0.1.0
pkgrel=1
pkgdesc='Logging MXNet Data for Visualization in TensorBoard'
arch=(any)
url=https://github.com/awslabs/mxboard
license=('Apach 2.0')
depends=(mxnet python-matplotlib python-numpy python-protobuf python-six python-scipy)
optdepends=(tensorboard)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=("mxboard-$pkgver.tar.gz"::"https://github.com/awslabs/mxboard/archive/v$pkgver.tar.gz")
sha512sums=('eeefde4ec65ecf803f0aa79c629d7b1a027e2503901736965e850dd5d6da76bf7794c05ca0dc60486bd219078df2781e061cc5797e1e9d987bbe02861065041c')

build() {
  cd mxboard-$pkgver/python
  python setup.py build
}

#check() {
#  cd mxboard-$pkgver
#  pytest -v
#}

package() {
  cd mxboard-$pkgver/python
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  install -Dm644 ../LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
