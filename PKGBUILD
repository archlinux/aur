# Maintainer: RaghavGohil raghavgohil2004@gmail.com

pkgname=den
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI tool for capturing and organizing project notes and context"
arch=('any')
url="https://github.com/RaghavGohil/den"
license=('MIT')

depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')

source=("$pkgname-$pkgver.tar.gz::https://github.com/RaghavGohil/den/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install the license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
