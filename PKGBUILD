pkgname=python-singletask
pkgver=1.1.3
pkgrel=1
pkgdesc="A compact, single-task-focused application for managing tasks and thoughts."
arch=('any')
url="https://topheim.com"
license=('MIT')
depends=('python' 'tk')
makedepends=('python-setuptools')
# We are not pulling any external sources; we use our local source tree.
source=("https://github.com/atopheim/python-singletask/releases/tag/v${pkgver}.tar.gz")
md5sums=()

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
