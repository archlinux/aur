# Maintainer: Yuki Joou <yukijoou at kemonomimi dot gay>

pkgname=python-types-pillow
_name=types-Pillow
pkgver="10.2.0.20240520"
pkgrel=1
pkgdesc="Typing stubs for Pillow"
arch=('any')
url="https://pypi.org/project/${_name}/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools')
_source_hash="f39b633b8dc20eb949fe3fc7cc188d1e8e83e8a5984041caff57b696ce4ab987"
source=("https://files.pythonhosted.org/packages/${_source_hash::2}/${_source_hash:2:2}/${_source_hash:4:60}/${_name}-${pkgver}.tar.gz")
sha256sums=('130b979195465fa1e1676d8e81c9c7c30319e8e95b12fae945e8f0d525213107')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

