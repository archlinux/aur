# Maintainer: Joffrey <j-off@live.fr>

pkgname=python2-pycryptodomex
pkgver=3.8.2
pkgrel=1
pkgdesc='A self-contained Python package of low-level cryptographic primitives'
url='https://www.pycryptodome.org'
arch=('x86_64' 'i686' 'armv7h' 'armv6h' 'aarch64')
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://pypi.org/packages/source/p/pycryptodomex/pycryptodomex-$pkgver.tar.gz")
sha256sums=('e50b15af6bbdc6b5f8bd70d818cb846b15303ffa6c371b799db561a403a21607')

package() {
    cd "$srcdir"/pycryptodomex-$pkgver
    install -Dm644 ./LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python2 ./setup.py install --root="$pkgdir" --optimize=1
}
