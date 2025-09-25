pkgname=wfreq
pkgver=0.1.7
pkgrel=1
pkgdesc="A package for text anlyzing"
arch=('any')
url="https://github.com/Vitalij-Burk/wfreq"
license=('MIT')
makedepends=('python-setuptools' 'python-pip' 'python-build')
depends=('python' 'python-rich' 'python-beautifulsoup4')
source=("$pkgname-$pkgver::git+https://github.com/Vitalij-Burk/wfreq.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m pip install --root="$pkgdir" --no-deps --ignore-installed dist/*.whl
}
