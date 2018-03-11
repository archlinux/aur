# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-tokenserver
_pkgname=tokenserver
pkgver=1.2.27
pkgrel=4
pkgdesc="The Mozilla Token Server"
arch=('any')
url="https://github.com/mozilla-services/tokenserver"
license=('MPL2')
depends=('python2' 'python2-cornice-0.16.2' 'python2-browserid')
source=("https://github.com/mozilla-services/tokenserver/archive/${pkgver}.tar.gz")
sha512sums=("318eb2fba337fbcabc9678fdd9dc704d68fb6eacf9d061a78a6463a504c6002608deab5179cbfe6f7e0b67d217bc6a21c77af407d70f5cdbf4eda6fb8d4e0a9b")

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

