# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

pkgname=python-uncompyle6
_name=uncompyle6
pkgver=3.2.0
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-spark-parser>=1.8.5' 'python-spark-parser<1.9.0' 'python-xdis>=3.8.2' 'python-xdis<3.9.0' 'python-six')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3985675039554fb0ce3c7cff823a747a93f96a29946c5f39ab3c0f72bad8a2a2')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir"
}
