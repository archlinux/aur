pkgname=python-singletask
pkgver=1.1.3
pkgrel=2
pkgdesc="A compact, single-task-focused application for managing tasks and thoughts."
arch=('any')
url="https://topheim.com"
license=('MIT')
depends=('python' 'tk')
makedepends=('python-setuptools')
source=("https://codeload.github.com/atopheim/python-singletask/tar.gz/refs/tags/v${pkgver}")
sha256sums=("bd287b9edddc21e67d48fc655886aa191ee5a121ad0748c52fcb09b74a6cc300")

prepare() {
    echo "No sources to download. Using local code."
}

build() {
    # We switch to the directory that contains setup.py and PKGBUILD.
    cd "$startdir"
    python setup.py build
}

package() {
    # Again, switch to the same directory so that setup.py is found.
    cd "$startdir"
    python setup.py install --root="$pkgdir" --optimize=1
}
