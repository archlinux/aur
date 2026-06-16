# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>

_pkgname=Arjun
pkgname=arjun
pkgver=2.2.7
pkgrel=4

pkgdesc="HTTP parameter discovery suite."
arch=("any")
url="https://github.com/s0md3v/Arjun"
license=("GPL3")

depends=("python" "python-requests" "python-dicttoxml" "python-ratelimit")
makedepends=("python-setuptools")

source=("$pkgname-$pkgver.zip::$url/archive/$pkgver.zip")
sha256sums=('507848e023f6e970d2e7f636b6a9ad6a4d6f8010019d978738f830f5a7ef966f')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
