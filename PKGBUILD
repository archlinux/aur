# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-grab
pkgver=0.6.21
pkgrel=1 
pkgdesc="Grab - Web Scraping Framework"
arch=('any')
url="http://github.com/lorien/grab"
license=('MIT')
depends=('python' 'python-pycurl' 'python-lxml' 'python-cssselect')
source=(https://pypi.python.org/packages/source/g/grab/grab-${pkgver}.tar.gz)
sha256sums=('cad55287c0da16b2e303ba27a4d77a2905c1ac3e73badb83d3d143b0fe701e99')

build() {
  cd "$srcdir/grab-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/grab-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
