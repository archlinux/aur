# Maintainer: Kira Sokolova <Kyra256@proton.me>

pkgname=python-picharsso
pkgver=2.0.1
pkgrel=1
pkgdesc="A utility for converting images to text art."
arch=("any")
url="https://github.com/kelvindecosta/picharsso"
license=('MIT')
_name=${pkgname#python-}
depends=(python-click python-numpy python-pillow python-sty)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz" "LICENSE::$url/raw/v$pkgver/LICENSE")
sha256sums=('eb4d8b1a1fe6927874d02362eeb2436f86bf9b4fee02cc0ac769e8b761c1276f' 'SKIP')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$_name-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}
