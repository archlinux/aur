# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=zipstream
pkgname=python-"$_pkgname"-gns3
pkgver=1.1.4
pkgrel=1
pkgdesc="Zipfile generator (GNS3)"
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('GPL3')
groups=('gns3')
depends=('python')
makedepends=('python-setuptools')
provides=("python-$_pkgname")
conflicts=("python-$_pkgname")
source=("https://files.pythonhosted.org/packages/1a/a4/58f0709cef999db1539960aa2ae77100dc800ebb8abb7afc97a1398dfb2f/$_pkgname-$pkgver.tar.gz")
sha256sums=('2ef24b9150c93429b172750c4890b5ab28c1317892e11727afeff986ad2a3506')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}
