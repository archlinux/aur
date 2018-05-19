# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

pkgname=python-uncompyle6
pkgver=3.1.3
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-spark-parser>=1.8.5' 'python-spark-parser<1.9.0' 'python-xdis>=3.8.0' 'python-xdis<3.9.0' 'python-six')
source=("https://github.com/rocky/${pkgname}/archive/release-${pkgver}.tar.gz")
sha256sums=('2432548e3caaaacb9b77b2ab9febdf4fe66edfd5c5f2e5ff9d8084c6d5eb2140')

build() {
    cd "$srcdir/$pkgname-release-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-release-$pkgver"
    python setup.py install --root="$pkgdir"
}
