# Maintainer: Nikolai Käck nikolaikack@icloud.com
pkgname=passly
pkgver=0.2.1
pkgrel=1
pkgdesc="A CLI toolkit for auditing and cleaning exported password manager data"
arch=('any')
url="https://github.com/nikooozzz/passly"
license=('MIT')
depends=('python' 'python-tldextract')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/nikooozzz/passly/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}