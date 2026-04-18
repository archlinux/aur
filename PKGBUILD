# Maintainer: RaghavGohil raghavgohil2004@gmail.com

pkgname=den
pkgver=0.2.0
pkgrel=1
pkgdesc="Context management for projects made easy."
arch=('any')
url="https://github.com/RaghavGohil/den"
license=('MIT')

depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')

source=("$pkgname-$pkgver.tar.gz::https://github.com/RaghavGohil/den/archive/v$pkgver.tar.gz")
sha256sums=('dd0fb548971e3d31664c689a9768e52dde6bd650cb550e47483fbacd297e97a6')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
