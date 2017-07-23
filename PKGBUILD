# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=linkchecker-gui
pkgver=9.4
pkgrel=2
pkgdesc="An GUI utility to check HTML documents for broken links."
arch=('any')
url="https://github.com/linkcheck/linkchecker-gui"
license=('GPL')
depends=('python2>=2.7.0' 'python2-requests' 'python2-pyqt4' 'linkchecker')
makedepends=('qt4')
optdepends=('python2-qscintilla: for gui version'
            'python2-pyqt4: for gui version')
source=("git+https://github.com/linkcheck/linkchecker-gui.git")
sha256sums=('SKIP')


package() {
  cd $srcdir/$pkgname
   (cd doc/html; make)
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1
}
