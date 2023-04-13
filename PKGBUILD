# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-zconfig
pkgver=3.6.1
pkgrel=1
pkgdesc="Structured Configuration Library"
url="https://github.com/zopefoundation/ZConfig"
license=('ZPL')
arch=('any')
makedepends=('python-setuptools')
checkdepends=('python-zope-testrunner' 'python-manuel' 'python-docutils' 'python-nose')
source=("https://github.com/zopefoundation/ZConfig/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('921e22260dde78673b2205115325fbe7fca0d0d061c04b33bc4f6f21b3af014bf4ee218ea228650bf66a12f058c5701f9dfab7c09cec49a64fd245595d300a92')

build() {
  cd ZConfig-$pkgver
  python setup.py build
}

check() {
  cd ZConfig-$pkgver
  nosetests3
}

package() {
  cd ZConfig-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1
}
