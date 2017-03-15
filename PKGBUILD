# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgbase=python-grab
pkgname=('python-grab' 'python2-grab')
pkgver=0.6.35
pkgrel=1
pkgdesc="Web Scraping Framework"
arch=('any')
url="https://pypi.python.org/pypi/grab"
license=('MIT')
makedepends=('python-pycurl' 'python2-pycurl' 'python-lxml' 'python2-lxml'
			'python-selection' 'python2-selection' 'python-six' 'python2-six'
			'python-weblib'	'python2-weblib' 'python-user_agent' 'python2-user_agent')
source=(https://pypi.python.org/packages/source/g/grab/grab-${pkgver}.tar.gz)
sha256sums=('a1e73360d7ed38cc64882f0faf9f52b12dcdabd8e1b6dbd6579182e068e2de86')

build() {
  cd $srcdir
  cp -r grab-$pkgver grab2-$pkgver
}

check() {
  cd $srcdir/grab-$pkgver
  python3 setup.py check

  cd $srcdir/grab2-$pkgver
  python2 setup.py check
}

package_python-grab() {
  cd "$srcdir/grab-$pkgver"
  python3 setup.py install --root "${pkgdir}" --optimize=1
}

package_python2-grab() {
  cd "$srcdir/grab2-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
