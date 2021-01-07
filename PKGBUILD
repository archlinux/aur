# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="pyluach"
_module="$_name"

pkgname=("python-$_module" "python2-$_module")
pkgdesc="Pyluach is a Python package for manipulating Hebrew dates, Gregorian-Hebrew calendar conversions, and other Jewish calendar related calculations"
pkgver="1.2.1"
pkgrel=1
url="https://github.com/simlist/pyluach"
license=('MIT')
arch=('any')
makedepends=("python-pbr>=1.9" "python2-pbr>=1.9")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
"LICENSE")
sha256sums=('7cdcee5aeaac82a6405ce3992fd872edaab03e13b49e34b3e415491cc5acb157'
            'a6900a379815872f27df1aac58d8c249ddd085259f6bab6768e162cc82d346b1')

build() {
    cd "$_name-$pkgver"
    python setup.py build
    python2 setup.py build
}

package_python-pyluach(){
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}

package_python2-pyluach(){
    cd "$_name-$pkgver"
    python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}
