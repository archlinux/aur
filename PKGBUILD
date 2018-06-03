# Maintainer: Scott Hansen <firecat4153@gmail.com>
pkgname=python-pykeepass
pkgver=2.8.2
pkgrel=1
pkgdesc="Low-level library to interact with keepass databases"
arch=("any")
url="https://github.com/pschmitt/pykeepass"
license=("GPL")
depends=("python" "python-crypto" "python-lxml" "python-libkeepass" "python-nose" "python-dateutil")
makedepends=("python-setuptools")
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('0f9c18d459abaf4b485a14806808aee5bc19521527ee0a296502bad61ba0ade4b82430eeecfeeeadd40ce743d7ad0c88c6b085f7a1e7009380196269c62362f1')

package() {
    cd "$srcdir/pykeepass-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
