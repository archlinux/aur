# Maintainer: Carl George < carl at george dot computer >

_name="pdir2"

pkgname=("python-$_name" "python2-$_name")
pkgver=0.2.1
pkgrel=1
pkgdesc="Pretty dir printing with joy"
arch=("any")
url="https://github.com/laike9m/$_name"
license=("MIT")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('baaf07033f71efddb1d1d8f63c4b3a3e66415ed91fb4f8895e746c0cc5c89238')

build() {
    cd "$_name-$pkgver"
    python setup.py build
    python2 setup.py build
}

package_python-pdir2() {
    depends=("python")
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-pdir2() {
    depends=("python2" "python2-enum34")
    cd "$_name-$pkgver"
    python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
