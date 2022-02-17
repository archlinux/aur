# Maintainer: dobedobedo <dobe0331 at gmail dot com>
_pkgname='alphashape'
pkgname=("python-$_pkgname")
pkgver=1.3.1
pkgrel=1
pkgdesc="Toolbox for generating n-dimensional alpha shapes."
arch=('x86_64')
depends=('python'
         'python-sphinx'
         'python-geopandas'
         'python-cartopy'
         'python-descartes'
         'python-networkx'
         'python-ipympl'
         'python-trimesh'
         'python-rtree'
         'python-click-log'
	)
makedepends=('python-setuptools'
             'python-pytest')
url='https://alphashape.readthedocs.io/en/latest/index.html'
license=('MIT')
sha256sums=('7a27340afc5f8ed301577acec46bb0cf2bada5410045f7289142e735ef6977ec')
_source_url="https://files.pythonhosted.org/packages/2e/83/67ff905694df5b34a777123b59fdfd05998d5a31766f188aafbf5b340055"
source=("$_source_url/$_pkgname-$pkgver.tar.gz")

build() {
    cd "$srcdir/$_pkgname-$pkgver/"
    python setup.py build
}

check(){
    cd "$srcdir/$_pkgname-$pkgver/"
    pytest
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
} 
