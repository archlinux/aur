# Maintainer: Václav Valíček <vaclav@valicek.name>

_pkgname=xdelta3
pkgname="python-$_pkgname"
pkgver=0.0.5
pkgrel=1
pkgdesc='Fast delta encoding using xdelta3'
arch=('any')
url="https://github.com/samuelcolvin/xdelta3-python"
license=('APACHE')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/9a/2e/18a4011d94e3a557be8b632f7d73b6d5e06998638f90c45c131bdf8edeb2/xdelta3-${pkgver}.tar.gz")
md5sums=('a7602b42b1772c052d64017c8944191f')


build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}


package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}


