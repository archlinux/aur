pkgname=python-singletask
pkgver=1.1.3
pkgrel=4
pkgdesc="A compact, single-task-focused application for managing tasks and thoughts."
arch=('any')
url="https://topheim.com"
license=('MIT')
depends=('python' 'tk')
makedepends=('python-setuptools')
source=("https://codeload.github.com/atopheim/python-singletask/tar.gz/refs/tags/v${pkgver}")
sha256sums=("bd287b9edddc21e67d48fc655886aa191ee5a121ad0748c52fcb09b74a6cc300")

build() {
    cd "$srcdir/$pkgname-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
