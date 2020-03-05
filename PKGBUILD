# Maintainer: Yacob Zitouni <yacob.zitouni@gmail.com>

pkgname=python-jproperties
_name=jproperties
pkgver=2.1.0
pkgrel=1
pkgdesc="Java Property file parser and writer for Python"
url="https://github.com/Tblue/python-jproperties"
depends=('python3')
makedepends=('python3' 'python-setuptools')
license=('BSD' 'Python')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('504d7b8d3b2f5f0f52c22c1f72bd50576dca17b01b4cd00d4359c6b0607a59ce')

build() {
    cd $srcdir/jproperties-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/jproperties-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1 
}
