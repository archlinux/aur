# Maintainer: Gustavo Jasso <gustavo at jasso dot info>
pkgname='python-getmac'
_name=${pkgname#python-}
pkgdesc="Pure-Python package to get the MAC address of network interfaces and hosts on the local network."
pkgver=0.8.2
pkgrel=1
url="https://github.com/GhostofGoes/getmac"
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('cf1af0d5c0e5d1fe7f62401bcb726a26')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    install -Dm644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
