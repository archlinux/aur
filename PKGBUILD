# Maintainer: Yuki Joou <yukijoou at kemonomimi dot gay>

pkgname=python-types-pillow
_name=types-Pillow
pkgver="10.2.0.20240213"
pkgrel=1
pkgdesc="Typing stubs for Pillow"
arch=('any')
url="https://pypi.org/project/${_name}/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools')
_source_hash="f73564af763d92b7c2178c2fb0e3269bf3ba83ac06f8d1cbd615d7483c405ce2"
source=("https://files.pythonhosted.org/packages/${_source_hash::2}/${_source_hash:2:2}/${_source_hash:4:60}/${_name}-${pkgver}.tar.gz")
sha256sums=("4800b61bf7eabdae2f1b17ade0d080709ed33e9f26a2e900e470e8b56ebe2387")

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

