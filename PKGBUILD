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
sha512sums=("56b38e10cc44966bffb2ee827a43ef5af525f7cd5bf4c8c2bbbfff510e41d7d30af36a4286221ee8a52556cd3bc42e5e469af470e9e18e10d7095ec1938d048c")

package() {
    cd "$srcdir/pykeepass-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

