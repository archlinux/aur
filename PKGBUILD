# Maintainer: Yuki Joou <yukijoou at kemonomimi dot gay>

pkgname=python-types-pillow
_name=types-Pillow
pkgver="10.2.0.20240511"
pkgrel=1
pkgdesc="Typing stubs for Pillow"
arch=('any')
url="https://pypi.org/project/${_name}/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools')
_source_hash="b81d8c5fada746c08341f41f33990fba91237678878e2fdd1883bb5ee6f4cb7c"
source=("https://files.pythonhosted.org/packages/${_source_hash::2}/${_source_hash:2:2}/${_source_hash:4:60}/${_name}-${pkgver}.tar.gz")
sha256sums=('b2fcc27b8e15ae3741941e43b4f39eba6fce6bcb152af90bbb07b387d2585783')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

