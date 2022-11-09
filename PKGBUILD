# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=duet
pkgname=python-$_name
pkgver=0.2.7
pkgrel=1
pkgdesc='A simple future-based async library for python.'
arch=(any)
url='https://github.com/google/duet'
license=('Apache')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('9eceec52d74dcccb8788fbac5b5da56346707bdd5dcfefd3242143e767c9441f339cd22e4a8a95b6cbac6dc61beb370b3efb982d06d62a9d1eb2618386eaa28f')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
