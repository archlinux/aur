# Maintainer: Yacob Zitouni <yacob.zitouni@gmail.com>

pkgname=python-jproperties
_name=jproperties
pkgver=2.0.0
pkgrel=3
pkgdesc="Java Property file parser and writer for Python"
url="https://github.com/Tblue/python-jproperties"
depends=('python3')
makedepends=('python3' 'python-setuptools')
license=('BSD' 'Python')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b6709652f5c602e5271f519cf14cb9bf5d5a101df06e6c1d300123477a239588')

build() {
    cd $srcdir/jproperties-2.0.0
    python setup.py build
}

package() {
    cd $srcdir/jproperties-2.0.0
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1 
}
