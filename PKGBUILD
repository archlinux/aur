pkgname=archwizard
pkgver=0.1.2
pkgrel=1
pkgdesc="A simple setup wizard for Arch Linux"
arch=('any')
url="https://github.com/KasishStar/ArchWizard"
license=('MIT')

depends=(
'python'
)

makedepends=(
'python-build'
'python-installer'
'python-setuptools'
)

source=(
"$pkgname-$pkgver.tar.gz::https://github.com/KasishStar/ArchWizard/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('1d770413fb326b86121fe1c15449d3c1b9acac36b131f3264b8ef865ee8c7992')

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
