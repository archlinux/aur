# Maintainer: Yoan Blanc <yoan@dosimple.ch>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=python2-pycryptodomex
pkgver=3.10.1
pkgrel=1
pkgdesc='A self-contained Python package of low-level cryptographic primitives'
arch=('x86_64')
url='https://www.pycryptodome.org/'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.org/packages/source/p/pycryptodomex/pycryptodomex-$pkgver.tar.gz")
sha512sums=('0ffd37e75caf6472529bbc231c7e74290267094eb3a6013a55d32dc6e11313017bb8161bdfef6c96e911e788b837caa445a9e1fe3e17e5e0254c139378f2a5e6')

build() {
    cd "$srcdir"/pycryptodomex-$pkgver
    python2 setup.py build
}

package() {
    cd pycryptodomex-$pkgver

    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}
