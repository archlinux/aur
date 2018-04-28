# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgbase=python-user_agent
pkgname=('python-user_agent' 'python2-user_agent')
pkgver=0.1.9
pkgrel=2 
pkgdesc="User-Agent generator"
arch=('any')
url="https://pypi.python.org/pypi/user_agent"
license=('MIT')
makedepends=('python' 'python2')
source=(https://files.pythonhosted.org/packages/c3/ca/15546284f62edfec7666ecb6403a6e77f5db850def37cd36f140d99cce02/user_agent-${pkgver}.tar.gz)
sha256sums=('8f1ad46cc4aef9f99515ea1c74bb8cacc43e23074c335b2ba2db7735ebe9c0d5')

build() {
  cd $srcdir
  cp -r user_agent-$pkgver user_agent2-$pkgver-python2
}

check() {
  cd $srcdir/user_agent-$pkgver 
  python setup.py check
  
  cd $srcdir/user_agent2-$pkgver-python2 
  python2 setup.py check  
}

package_python-user_agent() {
  depends=('python' 'python-six')
  cd "$srcdir/user_agent-$pkgver"
  python setup.py install --root "$pkgdir/" --optimize=1
}

package_python2-user_agent() {
  depends=('python2' 'python2-six')
  cd "$srcdir/user_agent2-$pkgver-python2"
  python2 setup.py install --root "$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
