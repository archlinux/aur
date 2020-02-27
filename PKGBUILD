# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Felix Yan <felixonmars@archlinux.org>

# Based on python-responses in [community]

_name=responses
pkgname=python2-$_name
pkgver=0.10.11
pkgrel=1
pkgdesc='A utility library for mocking out the `requests` Python library.'
arch=('any')
license=('Apache')
url="https://github.com/getsentry/$_name"
depends=('python2' 'python2-requests' 'python2-cookies' 'python2-six' 'python2-mock')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner' 'python2-pytest-cov' 'python2-flake8' 'python2-pytest-localserver')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('db443e9f34c2950214e26a5552e86989ff570678f1e43f4de5a25b6f85d8710d317e69305ae29077267b13b518cba06c52a835b7a67fd2640e05ebee362a0cf8')

build() {
  cd $_name-$pkgver

  python2 setup.py build
}

check() {
  cd $_name-$pkgver

  python2 setup.py pytest
}

package() {
  cd $_name-$pkgver

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
