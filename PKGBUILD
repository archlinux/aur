# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname=("python-sqreen")
pkgver=1.18.0
pkgrel=1
pkgdesc="Sqreen agent to protect Python applications"
arch=("any")
url="https://www.sqreen.com"
license=("CUSTOM")
options=(!emptydirs)
depends=("python")
source=(
    "https://files.pythonhosted.org/packages/a7/92/9b1d02f548d5755bd4e52061736333ce2374e12afb0eae0d58dfd1339f28/sqreen-1.18.0.tar.gz"
)
sha256sums=(
    "0626197913f71e6b39dd6a1f77a7d66726e8528f08a3b8650df4bf54ce0ed796"
)

build () {
    cd "$srcdir/sqreen-$pkgver"
    builddir="python3-build"
    python3 setup.py build
}

package () {
    cd "$srcdir/sqreen-$pkgver"
    python3 setup.py install --root="$pkgdir" -O1
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    echo "PROPRIETARY" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
