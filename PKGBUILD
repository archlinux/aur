# Maintainer: Paul Spruce <paul.spruce@gmail.com>
pkgname=arjun
_pkgname=Arjun
pkgver=2.1.5
pkgrel=1
pkgdesc="HTTP parameter discovery suite."
arch=("x86_64")
url="https://github.com/s0md3v/Arjun"
license=("GPL3")
depends=("python" "python-requests" "python-dicttoxml")
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('SKIP')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md CHANGELOG.md
}
