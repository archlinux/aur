# Maintainer: Yuki Joou <yukijoou at kemonomimi dot gay>

pkgname=python-types-pillow
_name=types-Pillow
pkgver=10.2.0.20240111
pkgrel=1
pkgdesc="Typing stubs for Pillow"
arch=('any')
url="https://pypi.org/project/${_name}/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/83/eb/e17f537e893676979918c1272f15d7ae3609decbf474a0d591d0c02918cb/${_name}-${pkgver}.tar.gz")
sha256sums=('e8d359bfdc5a149a3c90a7e153cb2d0750ddf7fc3508a20dfadabd8a9435e354')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

