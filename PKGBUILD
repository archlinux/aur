# Maintainer: RaghavGohil raghavgohil2004@gmail.com

pkgname=den
pkgver=0.1.5
pkgrel=1
pkgdesc="Braindumping for projects made easy."
arch=('any')
url="https://github.com/RaghavGohil/den"
license=('MIT')

depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')

source=("$pkgname-$pkgver.tar.gz::https://github.com/RaghavGohil/den/archive/v$pkgver.tar.gz")
sha256sums=('1f5af63bb34656a0eadd0083e3198985442790ce693acff47dad62acddcb5937')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
