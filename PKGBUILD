# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pyu2f
pkgver=0.1.5
pkgrel=3
pkgdesc="U2F host library for interacting with a U2F device over USB"
url="https://github.com/google/pyu2f"
license=('Apache')
arch=('any')
depends=('python38-six')
makedepends=('python38-setuptools')
checkdepends=('python38-mock' 'python38-pyfakefs' 'python38-pytest')
source=("https://github.com/google/pyu2f/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ddb15bb1d917117a2b19ad169ac0f8b8c7667d7ef8ee4c266cc30326429bb3627d41d84dc390ce0036d0b0f110e1d2da47d06d4e4d03a8be98cedb5ea3112246')

build() {
  cd pyu2f-$pkgver
  python3.8 setup.py build
}

check() {
  cd pyu2f-$pkgver
  pytest
}

package() {
  cd pyu2f-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
