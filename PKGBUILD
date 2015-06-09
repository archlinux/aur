#Maintainer: ParadoxSpiral <paradoxspiral[at]riseup[dot]net>
#Contributor: Cilyan Olowen <gaknar@gmail.com>
#Contributor: Nathan Jones <nathanj@insightbb.com>

pkgname=python2-webhelpers
pkgver=1.3
pkgrel=2
pkgdesc="A library of helper functions to make writing templates in web applications easier"
depends=('python2')
makedepends=('setuptools')
conflicts=('python-webhelpers')
source=("http://pypi.python.org/packages/source/W/WebHelpers/WebHelpers-$pkgver.tar.gz")
url="http://pypi.python.org/pypi/WebHelpers/1.3"
license=('BSD')
arch=('any')
md5sums=('32749ffadfc40fea51075a7def32588b')

package() {
    cd $srcdir/WebHelpers-$pkgver
    python2 setup.py install --root=$pkgdir/ --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|"         \
	   -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
        $(find $pkgdir -name '*.py')
}
