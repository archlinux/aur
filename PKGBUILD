# Maintainer: Yuki Joou <yukijoou at kemonomimi dot gay>

pkgname=python-types-pillow
_name=types-Pillow
pkgver="10.2.0.20240406"
pkgrel=1
pkgdesc="Typing stubs for Pillow"
arch=('any')
url="https://pypi.org/project/${_name}/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools')
_source_hash="8588f5da0cf539384631946dd927e93c6f1ae61ba424452b27c45fcf434cd37b"
source=("https://files.pythonhosted.org/packages/${_source_hash::2}/${_source_hash:2:2}/${_source_hash:4:60}/${_name}-${pkgver}.tar.gz")
sha256sums=('62e0cc1f17caba40e72e7154a483f4c7f3bea0e1c34c0ebba9de3c7745bc306d')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

