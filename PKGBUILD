pkgname=python-amqpy-git
pkgver=v0.11.0.r0.g87977a5
pkgrel=1
pkgdesc="Python 3 AMQP 0.9.1 client library"
arch=(any)
url='https://github.com/veegee/amqpy/'
license=(custom:MIT)
makedepends=(git python-setuptools)
source=("${pkgname}::git+https://github.com/veegee/amqpy.git")
sha256sums=('SKIP')

pkgver() {
   cd "$srcdir/$pkgname"
   git describe --long | sed 's/\([^-]*-g\)/r\1/;y/-/./'
}

package() {
   cd "$srcdir/$pkgname"
   python setup.py install --root="$pkgdir/" -O1
   install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname"/LICENSE
}
