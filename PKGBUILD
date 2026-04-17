# Maintainer: RaghavGohil raghavgohil2004@gmail.com

pkgname=den
pkgver=0.1.4
pkgrel=1
pkgdesc="Braindumping for projects made easy."
arch=('any')
url="https://github.com/RaghavGohil/den"
license=('MIT')

depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')

source=("$pkgname-$pkgver.tar.gz::https://github.com/RaghavGohil/den/archive/v$pkgver.tar.gz")
sha256sums=('7355cb10a15b3fb7b7659656ae1be8c3c049575e342d5627f2f2dc0c746fa627')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
