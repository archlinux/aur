# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-weblib
pkgver=0.1.14
pkgrel=1 
pkgdesc="Set of tools for web scraping projects"
arch=('any')
url="UNKNOWN"
license=('MIT')
depends=('python' 'python-lxml' 'python-six' 'python-pytils')
source=(https://pypi.python.org/packages/source/w/weblib/weblib-${pkgver}.tar.gz)
sha256sums=('f9602ce66a6c5e010509d515a57b55d8c9d1eda8c4cbf5544a9ae11382618d8a')

build() {
  cd "$srcdir/weblib-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/weblib-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
