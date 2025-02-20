# Maintainer: Kumi <hostsd@kumi.email>
pkgname=hostsd

pkgver=0.1.4
_tag=v$pkgver
_checksum=1f5fdac1f82bd053cfb77bea90ad2cbde37efbe95e923f1ad187a1aef9f28d0e62b01ae8b63ffd0b691e0ee15cbdfbdd97fd63a9b18b1aaf4b399743dd02674b
pkgrel=1

pkgdesc="A simple hosts file manager"
arch=('any')
url="https://git.private.coffee/kumi/hostsd"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("git+$url.git#tag=$_tag")
sha512sums=("$_checksum")

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

