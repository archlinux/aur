# Maintainer: portaloffreedom

_pkgsrcname=duckduckgo2
pkgname=python-duckduckgo2
pkgver=0.242
pkgrel=1
pkgdesc="Library for querying the DuckDuckGo API"
url="http://github.com/crazedpsyc/python-duckduckgo/"
license=("BSD")
arch=("any")
depends=('python')
source=(
    "https://pypi.python.org/packages/6c/2f/33c29da133061032843aed6630bdcda8456dbb5f6026e091ff6a3176c8e7/$_pkgsrcname-$pkgver.tar.gz"
    2to3.patch
)

md5sums=(
    'd9668a03c41a34d7a43275303172cc3e'
    '50abb22432941daae37240283795f171'
)

prepare() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  patch -p1 -i ../../2to3.patch
}

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py install --root $pkgdir
}


