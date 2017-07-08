# Maintainer: Carl George < arch at cgtx dot us >

_name="pdir"

#pkgname=("python-$_name" "python2-$_name")
pkgbase="python-$_name"
pkgname=("python2-$_name")
pkgver=0.2.2
pkgrel=1
pkgdesc="A selective pretty dir printing utility for Python"
arch=("any")
url="https://github.com/pramttl/$_name"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/pramttl/pdir/master/LICENSE.txt")
sha256sums=('43e7fdd73807b17c58f548db04eabba8cbea4033582a42b9d3c98ceda1fbfffb'
            '4c43622e8623588a38649c02856603b9fbe932c2c9f9cd7694278bc36a332c16')

build() {
    cd "$_name-$pkgver"
    #python setup.py build
    python2 setup.py build
}

#package_python-pdir() {
#    depends=("python")
#    cd "$_name-$pkgver"
#    python setup.py install --skip-build --root="$pkgdir" --optimize=1
#    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE.txt"
#}

package_python2-pdir() {
    depends=("python2")
    cd "$_name-$pkgver"
    python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE.txt"
}
