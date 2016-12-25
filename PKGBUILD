# Maintainer: Jean-Luc Tambasco <an.obscurity@gmail.com>

pkgname=ipkiss
pkgver=2.4ce
pkgrel=1
pkgdesc="IPKISS is a parametric design framework focused (but not limited) to Photonic circuit design, originally constructed at Ghent University and IMEC."
arch=('x86_64')
url="http://www.ipkiss.org/"
license=('GPLv2')
groups=('ipkiss')
depends=('geos'
         'python2-shapely'
         'descartes'
         'python2-matplotlib')
source=("https://pypi.python.org/packages/73/cc/f1a89a169ceedf5544bd457f301e4639363b3e9d0ce2d62c5910e30018d9/ipkiss24ce.tar.gz#md5=c29a84d227f96d8922e1b85ee7900e4f")
md5sums=('c29a84d227f96d8922e1b85ee7900e4f')

build() {
        cd "$srcdir/${pkgname}${pkgver//.}"
        python2 setup.py build
}

package() {
        cd "$srcdir/${pkgname}${pkgver//.}"
        python2 setup.py install --root="$pkgdir" --optimize=1
}
