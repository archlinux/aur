
# Maintainer: Muhammad Dhiyaul Atha <mdhyaulatha@gmail.com>
pkgname=netguardify
pkgver=1.0.5
pkgrel=1
pkgdesc="Professional, open-source cybersecurity CLI tool for Linux"
arch=('any')
url="https://github.com/Bangkah/sentinel"
license=('MIT')
depends=('python' 'python-psutil' 'python-colorama')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Bangkah/sentinel/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
