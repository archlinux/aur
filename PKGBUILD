# Maintainer: Ainola
# Contributor: Hugo Osvaldo Barrera
# Contributor: Joel Pedraza

pkgname=python-humblebundle
_upstream_name=humblebundle-python
pkgver=0.1.1
pkgrel=4
pkgdesc="An unofficial library for querying the Humble Bundle API"
arch=('any')
url="https://github.com/saik0/humblebundle-python"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver::https://github.com/saik0/humblebundle-python/archive/$pkgver.tar.gz")
sha256sums=('51afe971fa66d1da43c574d0bbe117abd3c6b6a0351b4273dd97ffb3d1a031bf')

build() {
    cd "$_upstream_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_upstream_name-$pkgver"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"

    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
