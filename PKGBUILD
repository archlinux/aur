# $Id$
# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>

pkgname=python2-mpldatacursor-git
pkgver=20140121
pkgrel=1
pkgdesc="Interactive data cursors (clickable annotation boxes) for matplotlib."
arch=('i686' 'x86_64')
url='https://github.com/joferkington/mpldatacursor'
license=('MIT')
depends=('python2-matplotlib>=0.9' 'python2-numpy>=1.1')
source=("$pkgname"::'git://github.com/joferkington/mpldatacursor.git')
sha1sums=('SKIP')

pkgver() {
    date +%Y%m%d
}

build() {
    cd ${srcdir}/${pkgname}
    python2 setup.py build
}

package() {
    cd ${srcdir}/${pkgname}
    python2 setup.py install -O1 --skip-build --root "${pkgdir}" --prefix=/usr
}
