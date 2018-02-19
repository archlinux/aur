# Maintainer: Scott Hansen <firecat4153@gmail.com>
pkgname=python-pykeepass
pkgver=2.8.1
pkgrel=1
pkgdesc="Low-level library to interact with keepass databases"
arch=("any")
url="https://github.com/pschmitt/pykeepass"
license=("GPL")
depends=("python" "python-crypto" "python-lxml" "python-libkeepass" "python-nose" "python-dateutil")
makedepends=("python-setuptools")
source=("$url/archive/$pkgver.tar.gz")
sha512sums=("9f6635ccc911fb71c75573d3aa1f5c3a3db705c907da81e83eae0fd3d9c74aaa5380adda75a9444f9a661a388eee360dba434cc5abef967c3453c35aae7259ef")

package() {
    cd "$srcdir/pykeepass-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
