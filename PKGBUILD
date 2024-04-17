# Maintainer: Yuki Joou <yukijoou at kemonomimi dot gay>

pkgname=python-types-pillow
_name=types-Pillow
pkgver="10.2.0.20240415"
pkgrel=1
pkgdesc="Typing stubs for Pillow"
arch=('any')
url="https://pypi.org/project/${_name}/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools')
_source_hash="58f15fecb2859c271e611b17bd20d9fbe22513f35c0f01ff63bae2a7ff8bd0f7"
source=("https://files.pythonhosted.org/packages/${_source_hash::2}/${_source_hash:2:2}/${_source_hash:4:60}/${_name}-${pkgver}.tar.gz")
sha256sums=('dd6058027639bcdc66ba78b228cc25fdae42524c2150c78c804da427e7e76e70')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

