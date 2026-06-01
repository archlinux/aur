pkgname=termwatch
pkgver=1.0.0
pkgrel=1
pkgdesc="A beautiful high-density cyberpunk system monitor fetch dashboard"
arch=('any')
url="https://github.com/KasishStar/termwatch"
license=('MIT')

depends=(
'python'
'python-textual'
'python-psutil'
)

makedepends=(
'python-build'
'python-installer'
'python-setuptools'
)

source=(
"$pkgname-$pkgver.tar.gz::https://github.com/KasishStar/termwatch/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('c95dd92c12898bb6d47ab4720688c0ba4616072250584439c574cee238788431')

build() {
cd "$srcdir/$pkgname-$pkgver"
python -m build --wheel --no-isolation
}

package() {
cd "$srcdir/$pkgname-$pkgver"

```
python -m installer \
    --destdir="$pkgdir" \
    dist/*.whl

install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
```

}
