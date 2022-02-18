# Maintainer: Kyan Wanschers <kyan@blackdrgn.nl>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=python2-pycryptodomex
pkgver=3.14.1
pkgrel=1
pkgdesc='A self-contained Python package of low-level cryptographic primitives'
arch=('x86_64')
url='https://www.pycryptodome.org/'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.org/packages/source/p/pycryptodomex/pycryptodomex-$pkgver.tar.gz")
sha512sums=('cd01431b9178bcb27332741097cf020859c48df83219bac9d6ffa1f52db1f112b562478260baa1aed4674e2833d6e0cd5794a43dafb09fda007fdce7a7330495')

build() {
    cd "$srcdir"/pycryptodomex-$pkgver
    python2 setup.py build
}

package() {
    cd pycryptodomex-$pkgver

    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}
