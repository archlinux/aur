# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=python-gluoncv
pkgver=0.3.0
pkgrel=2
pkgdesc='A Deep Learning Toolkit for Computer Vision'
arch=(any)
url=https://gluon-cv.mxnet.io
license=('Apache')
depends=(mxnet python-matplotlib python-numpy python-scipy)
makedepends=(python-setuptools)
checkdepends=(python-nose python-pytest python-scipy)
source=("gluoncv-$pkgver.tar.gz"::"https://github.com/dmlc/gluon-cv/archive/v$pkgver.tar.gz")
sha512sums=('0dc5c3e5dfed3451fcf1746be49702d8b1927aac24cda23458cbbc10359463c0d50ad5e6a431624027cf47f0c52dd99050282d72595b6c181928516bee312a51')

build() {
  cd gluon-cv-$pkgver
  python setup.py build
}

#check() {
#  cd gluon-cv-$pkgver
#  pytest -v
#}

package() {
  cd gluon-cv-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
