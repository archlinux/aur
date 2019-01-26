# Maintainer: Faerbit <faerbit at gmail dot com>
# Original author: kalenz <archlinux@kalenz.fr>

pkgname="python2-androguard"
pkgver=3.3.2
pkgrel=1
pkgdesc="Python framework for Android application analysis."
arch=("any")
url="https://github.com/androguard/androguard/"
license=("Apache")
depends=("python2" "python2-setuptools")
optdepends=(
    "ipython2: interactive analysis support"
    "python2-pygments: color support"
    #"pydot: CFG support"
    "python2-magic: file identification support"
    "sparsehash: elsim support"
    "muparser: elsim support"
    "snappy: elsim support"
    "bzip2: elsim support"
    "zlib: elsim support"
    #"psyco2-svn: acceleration support"
    "python2-pyside: GUI"
)
makedepends=("git")
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/androguard/androguard/archive/v${pkgver}.tar.gz")
md5sums=('3432e82be8c293e3b8c8044de7f7f281')

package() {
    cd "$srcdir/androguard-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
