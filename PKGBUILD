# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="pyluach"
_module="$_name"

pkgname=("python-$_module")
pkgdesc="Pyluach is a Python package for manipulating Hebrew dates, Gregorian-Hebrew calendar conversions, and other Jewish calendar related calculations"
pkgver="2.2.0"
pkgrel=1
url="https://github.com/simlist/pyluach"
license=('MIT')
arch=('any')
makedepends=("python-pbr>=1.9")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "LICENSE")
sha256sums=('9063a25387cd7624276fd0656508bada08aa8a6f22e8db352844cd858e69012b'
            'a6900a379815872f27df1aac58d8c249ddd085259f6bab6768e162cc82d346b1')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package_python-pyluach(){
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}
