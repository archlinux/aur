# Maintainer: RaghavGohil raghavgohil2004@gmail.com

pkgname=den
pkgver=0.1.1
pkgrel=1
pkgdesc="Braindumping for projects made easy."
arch=('any')
url="https://github.com/RaghavGohil/den"
license=('MIT')

depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')

source=("$pkgname-$pkgver.tar.gz::https://github.com/RaghavGohil/den/archive/v$pkgver.tar.gz")
sha256sums=('699654b45bce80b0d76e98f41c95f870d7da7cf23b54098752e0df15e92d1399')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
