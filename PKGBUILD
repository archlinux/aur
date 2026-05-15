# Maintainer: Shiho Sakura <shiho@sakurastudios.eu>

pkgname=sakura-lsltest
pkgver=1.0.0
pkgrel=1
pkgdesc="Pytest-like test framework for LSL — drives sakura-lslc and sakura-slemu"
arch=('any')
url="https://github.com/Sakura-Studios-IKE/sakura-lsltest"
license=('MIT')
depends=('python>=3.9')
optdepends=('sakura-lslc' 'sakura-slemu')
makedepends=('python-setuptools' 'python-pip' 'python-build' 'python-installer' 'python-wheel' 'gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Sakura-Studios-IKE/sakura-lsltest/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/sakura-lsltest-$pkgver"
    make
}

package() {
    cd "$srcdir/sakura-lsltest-$pkgver"
    python -m pip install --root="$pkgdir" --prefix=/usr --no-deps --no-build-isolation .
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
