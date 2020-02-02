# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Felix Yan <felixonmars@archlinux.org>

# Based on python-responses in [community]

_name=responses
pkgname=python2-$_name
pkgver=0.10.10
pkgrel=1
pkgdesc='A utility library for mocking out the `requests` Python library.'
arch=('any')
license=('Apache')
url="https://github.com/getsentry/$_name"
depends=('python2' 'python2-requests' 'python2-cookies' 'python2-six' 'python2-mock')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner' 'python2-pytest-cov' 'python2-flake8' 'python2-pytest-localserver')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('7a33529741e211ddf204543cd3490b8502fe8eb3d26f0b5956ce02d6a0e0273697d65d5eacf85ef7fc6470239daeb66a949e1c5200446792d8b8d24a31c88025')

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
