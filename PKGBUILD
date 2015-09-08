# Maintainer: kalenz <archlinux@kalenz.fr>

pkgname="python2-androguard-git"
pkgver=714.e4ccf50
pkgrel=1
pkgdesc="Python framework for Android application analysis."
arch=("any")
url="https://code.google.com/p/androguard/"
license=("Apache")
depends=("python2" "python2-setuptools")
optdepends=(
    "ipython2: interactive analysis support"
    "python2-pygments: color support"
    "pydot: CFG support"
    "python2-magic: file identification support"
    "sparsehash: elsim support"
    "muparser: elsim support"
    "snappy: elsim support"
    "bzip2: elsim support"
    "zlib: elsim support"
    "psyco2-svn: acceleration support"
    "python2-pyside: GUI"
)
makedepends=("git")
options=(!emptydirs)
source=("androguard::git://github.com/androguard/androguard.git")
sha1sums=("SKIP")

_gitname="androguard"

pkgver() {
    cd "$srcdir/$_gitname"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_gitname"
}

package() {
    cd "$srcdir/$_gitname"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
