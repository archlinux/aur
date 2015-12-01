# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

pkgname=gprof2dot
pkgver=2015.12.1
pkgrel=1
pkgdesc="A Python script to convert the output from many profilers into a dot graph."
arch=("any")
url="http://jrfonseca.googlecode.com/"
license=('LGPL')
depends=('python' 'python-setuptools')
makedepends=('git')
provides=(gprof2dot)
source=("https://pypi.python.org/packages/source/g/gprof2dot/gprof2dot-$pkgver.tar.gz")
md5sums=('e23bf4e2f94db032750c193384b4165b')
build() {
cd "$srcdir/gprof2dot-$pkgver"
python setup.py build
# move this "old" version out of the way
#mv "$pkgdir/usr/bin/smiley" "$pkgdir/usr/bin/smiley2"
# should report this upstream as still not fixed...
#sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" \
#$pkgdir/usr/lib/python2.7/site-packages/smiley.py

}
package() {
cd "$srcdir/gprof2dot-$pkgver"
python setup.py install --prefix=/usr --root="$pkgdir"
}
