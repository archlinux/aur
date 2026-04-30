# Maintainer: digital_mystik <dgtl_mystik at protonmail dot ch>

_name=construct-classes
pkgname=python-construct-classes
pkgver=0.2.3
pkgrel=1
pkgdesc="Parse your binary data into dataclasses. Pack your dataclasses into binary data."
arch=('any')
url="https://github.com/matejcik/construct-classes"
license=('MIT')
depends=('python' 'python-construct')
makedepends=('python-build'  'python-flit' 'python-poetry-core' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/matejcik/$_name/archive/refs/tags/v$pkgver.tar.gz")

b2sums=('089af3bc7d304a73bfc4fdc70513907ad7e1eeea54490e4595aeccb1ca3de8284cd4aadd9341ace81862e9e7552b4b11a517c8cc9746411ab57fa68211450c82')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
