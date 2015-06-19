# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-grab
pkgver=0.6.19
pkgrel=1 
pkgdesc="Grab - Web Scraping Framework"
arch=('any')
url="http://github.com/lorien/grab"
license=('MIT')
depends=('python' 'python-pycurl' 'python-lxml' 'python-cssselect')
source=(https://pypi.python.org/packages/source/g/grab/grab-${pkgver}.tar.gz)
sha256sums=('4d77969ff085e6ca089d166115ab8fe50922fcb822e6a8e49d62e094cac970b8')

build() {
  cd "$srcdir/grab-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/grab-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
