# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=linkchecker
pkgver=9.4
pkgrel=2
pkgdesc="An command line utility to check HTML documents for broken links."
arch=('any')
url="https://github.com/linkcheck/linkchecker"
license=('GPL')
depends=('python2>=2.7.0' 'python2-requests' 'python2-dnspython')
source=("git+https://github.com/linkcheck/linkchecker.git")
sha256sums=('SKIP')


package() {
  cd $srcdir/$pkgname
  python2 setup.py sdist --manifest-only || return 1
  (cd doc; make)
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1
}
