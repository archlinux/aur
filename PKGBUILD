# Maintainer: Qirui Wang <wqr.prg@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >

_name="sanic-routing"
pkgname="python-$_name"
pkgver=0.7.2
pkgrel=1
pkgdesc='Internal handler routing for Sanic beginning with v21.3.'
arch=("any")
url='https://sanicframework.org/'
license=("MIT")
makedepends=("python-setuptools")
source=("https://github.com/sanic-org/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('492008d10b58089b115b493c2635a6743736bf456648219ca646efd76eb425e7')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/licence"
}
