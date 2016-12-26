# Maintainer: Jean-Luc Tambasco <an.obscurity@gmail.com>

pkgname=ipkiss
pkgver=2.4ce
pkgrel=1
pkgdesc="IPKISS is a parametric design framework focused (but not limited) to Photonic circuit design, originally constructed at Ghent University and IMEC."
arch=('x86_64')
url="https://github.com/jtambasco/ipkiss"
license=('GPLv2')
groups=('ipkiss')
depends=('geos'
         'python2-shapely'
         'descartes'
         'python2-matplotlib')
source=("git+https://github.com/jtambasco/ipkiss.git")
md5sums=('SKIP')

build() {
        cd "$srcdir/${pkgname}"
        python2 setup.py build
}

package() {
        cd "$srcdir/${pkgname}"
        python2 setup.py install --root="$pkgdir" --optimize=1
}
