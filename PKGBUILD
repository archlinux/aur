# Maintainer: Scott Hansen <firecat4153@gmail.com>
pkgname=python-pykeepass
pkgver=3.0.2
pkgrel=1
pkgdesc="Low-level library to interact with keepass databases"
arch=("any")
url="https://github.com/pschmitt/pykeepass"
license=("GPL")
depends=("python" "python-argon2_cffi" "python-construct" "python-dateutil" "python-lxml" "python-pycryptodome")
makedepends=("python-setuptools")
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('9a29a68790ff0c724d04a4bfd66103f0a10607fdcec4b74b0943ad843775804f607a60bd35cdd910541f6610745a0a77e62e69a55303d3785ef5ec64c6bf9780')

package() {
    cd "$srcdir/pykeepass-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
