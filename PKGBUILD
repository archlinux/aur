# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=python2-pycryptodomex
pkgver=3.9.9
pkgrel=2
pkgdesc='A self-contained Python package of low-level cryptographic primitives'
arch=('x86_64')
url='https://www.pycryptodome.org/'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.org/packages/source/p/pycryptodomex/pycryptodomex-$pkgver.tar.gz")
sha512sums=('68a59cd537c1745db0082979716f0ba0508bb9d82d7129d42931056b5927f27ada1b92f88cc7c4d3954a02cd724a88c0e60fa38a5d8d7c73baa6541d332ff8a9')

build() {
    cd "$srcdir"/pycryptodomex-$pkgver
    python2 setup.py build
}

package() {
    cd pycryptodomex-$pkgver

    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}
