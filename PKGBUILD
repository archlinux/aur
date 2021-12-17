# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Ludvig Broberg
# Contributor:  Amir Taaki
# Contributor:  The Bitcoin Core Developers

pkgname=python-secp256k1-git
pkgver=0.13.2.4.2.gf5e4552
pkgrel=4

pkgdesc='Python FFI bindings for libsecp256k1'
arch=('any')
url='https://github.com/ludbb/secp256k1-py'
license=('MIT')

depends=('python-cffi' 'python-pycparser' 'libsecp256k1')
provides=('python-secp256k1-git' 'python-secp256k1')
conflicts=('python-secp256k1')

source=('git://github.com/ludbb/secp256k1-py')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/secp256k1-py/"
    git describe | sed 's/-/./g'
}

package() {
    cd "$srcdir/secp256k1-py/"
    python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
}
