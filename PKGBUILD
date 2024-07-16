# Maintainer: Niklas Reimer <niklas at backbord dot net>
pkgname='python-getmac'
_name=${pkgname#python-}
pkgdesc="Pure-Python package to get the MAC address of network interfaces and hosts on the local network."
pkgver=0.9.5
pkgrel=1
url="https://github.com/GhostofGoes/getmac"
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('ec476b060039d2d8d86de0502e43a5ac')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    install -Dm644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
