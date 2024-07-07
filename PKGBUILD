# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: DoTheEvolution <DoTheEvo@gmail.com>
pkgname=angrysearch
pkgver=1.0.4
pkgrel=2
pkgdesc="Linux file search, instant results as you type"
arch=('any')
url="https://github.com/DoTheEvo/ANGRYsearch"
license=('GPL2')
depends=('python-pyqt5' 'libxkbcommon-x11' 'xdg-utils')
makedepends=('git')
optdepends=('python-gobject: desktop notifications support'
            'xdotool: Thunar & PCmanFM to select file on path open')
source=("https://github.com/DoTheEvo/ANGRYsearch/archive/v$pkgver.tar.gz")
# source=("git+https://github.com/DoTheEvo/ANGRYsearch.git#commit=$_commit")
sha256sums=("35287f7232f3892308186b33c05369ca8123647fbae6b8be0bb43f28ff052de9")

pkgver() {
    cd "$srcdir/ANGRYsearch-$pkgver"
    python setup.py --version
}

build() {
    cd "$srcdir/ANGRYsearch-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/ANGRYsearch-$pkgver"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
