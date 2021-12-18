# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: DoTheEvolution <DoTheEvo@gmail.com>
pkgname=angrysearch
pkgver=1.0.3
pkgrel=1
pkgdesc="Linux file search, instant results as you type"
arch=('any')
url="https://github.com/DoTheEvo/ANGRYsearch"
license=('GPL2')
depends=('python-pyqt5' 'libxkbcommon-x11' 'xdg-utils')
makedepends=('git')
optdepends=('python-gobject: desktop notifications support'
            'xdotool: Thunar & PCmanFM to select file on path open')
_commit=8280de62976f12432cfd42d918828aa4aafc0a01
source=("git+https://github.com/DoTheEvo/ANGRYsearch.git#commit=$_commit")
#source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/ANGRYsearch"
    python setup.py --version
}

build() {
    cd "$srcdir/ANGRYsearch"
    python setup.py build
}

package() {
    cd "$srcdir/ANGRYsearch"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
