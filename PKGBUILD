# Maintainer: digital_mystik <dgtl_mystik at protonmail dot ch>

_name=construct-classes
pkgname=python-construct-classes
pkgver=0.1.2
pkgrel=1
pkgdesc="Parse your binary data into dataclasses. Pack your dataclasses into binary data."
arch=('any')
url="https://github.com/matejcik/construct-classes"
license=('MIT')
depends=('python' 'python-construct')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("$pkgname-$pkgver.tar.gz::https://github.com/matejcik/$_name/archive/refs/tags/v$pkgver.tar.gz")

b2sums=('d68425b9c9dc0d96fca1560a03a71a9f544adc5e4e67742ecd580e57433a2f147e4041573f95c83d127e98787bc6ee11552d437d073fb288da0eb02f7ed6e9ed')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
