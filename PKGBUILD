# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-doublex-expects
pkgname=('python-doublex-expects' 'python2-doublex-expects')
pkgver=0.7.0
pkgrel=1
pkgdesc="Expects matchers for Doublex test doubles assertions"
arch=('any')
license=('Apache')
url="https://github.com/jaimegildesagredo/doublex-expects"
makedepends=('python-setuptools' 'python2-setuptools' 'python-doublex' 'python2-doublex'
             'python-expects' 'python2-expects')
checkdepends=('python-mamba' 'python2-mamba')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/jaimegildesagredo/doublex-expects/archive/v$pkgver.tar.gz")
sha512sums=('68aac0e9d8e6dae3c7007cf59e32ba8ea96f3d70377112431e10e59984ec6167e8fca57e0428e01ddcdd3b7f1c784e04c0a6837f7d297b1fcebf130c022b8f7c')

build() {
  cd doublex-expects-$pkgver
  python setup.py build
  python2 setup.py build
}

check() {
  cd doublex-expects-$pkgver
  mamba
  mamba2
}

package_python-doublex-expects() {
  depends=('python-doublex' 'python-expects')

  cd doublex-expects-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-doublex-expects() {
  depends=('python2-doublex' 'python2-expects')

  cd doublex-expects-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
