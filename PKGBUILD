# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname='python2-setuptools-lint'
pkgver=0.6.0
pkgrel=1
_name=setuptools-lint
pkgdesc="Expose pylint as a lint command into setup.py"
arch=('any')
url="https://pypi.org/project/setuptools-lint/"
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('d36c10bab45672b3c7d92391c8f1ae297a483500654e8b31a312587c9d9355a74beddb466ea952fa4cc8bc035c4f631536eeefd61ae159f807767f61fabc72d4')
makedepends=('python2-setuptools')
depends=('python2-pylint')

build() {
    cd "$srcdir/${_name}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "$srcdir/${_name}-${pkgver}"
    python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build;
}
