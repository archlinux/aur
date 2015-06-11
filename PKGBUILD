# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=python2-pyscss-kilo
pkgver=1.2.1
pkgrel=1
pkgdesc="a Scss compiler for Python"
url="http://pypi.python.org/pypi/pyScss"
license="MIT"
depends=("python2"  "python2-six")
makedepends=("python2-setuptools")
arch=('any')
source=(http://pypi.python.org/packages/source/p/pyScss/pyScss-$pkgver.tar.gz)
md5sums=('9a5c24922643f6e90ea03d520700521b')


package() {
    cd $srcdir/pyScss-$pkgver
    python2 setup.py build  || return 1
    python2 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
