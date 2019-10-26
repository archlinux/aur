# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-doublex-expects
pkgname=('python-doublex-expects' 'python2-doublex-expects')
pkgver=0.7.1
pkgrel=2
pkgdesc="Expects matchers for Doublex test doubles assertions"
arch=('any')
license=('Apache')
url="https://github.com/jaimegildesagredo/doublex-expects"
makedepends=('python-setuptools' 'python2-setuptools' 'python-doublex' 'python2-doublex'
             'python-expects' 'python2-expects')
checkdepends=('python-mamba' 'python2-mamba')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/jaimegildesagredo/doublex-expects/archive/v$pkgver.tar.gz")
sha512sums=('2aaff2e58556ed9eb91ebb418e65058367411e011e843afb5adb08ab69705b6bdfb478d3052aae093ad1c1a1b49ba1e084e4c5510acde4874182a658330e3448')

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
