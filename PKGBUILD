# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

pkgname=gprof2dot
pkgver=2015.02.03
pkgrel=1
pkgdesc="A Python script to convert the output from many profilers into a dot graph."
arch=("any")
url="http://jrfonseca.googlecode.com/"
license=('LGPL')
depends=(python)
makedepends=('git')
provides=(gprof2dot)
source=("https://pypi.python.org/packages/source/g/gprof2dot/gprof2dot-$pkgver.tar.gz")
md5sums=('b026772f1cc8f7f203143855e0316443')
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
