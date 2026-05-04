pkgname=encrypter
pkgver=3.0.0
pkgrel=1
pkgdesc="Saydut Encrypter - XChaCha20-Poly1305 + Argon2id ile dosya/klasor sifreleme (.saydut)"
arch=('any')
url="https://github.com/saydut/encrypter"
license=('GPL3')
depends=('python' 'python-pynacl' 'python-customtkinter' 'python-requests' 'python-typer')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
source=("git+https://github.com/saydut/encrypter.git#branch=master")
md5sums=('SKIP')

build() {
    cd "$srcdir/encrypter"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/encrypter"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
