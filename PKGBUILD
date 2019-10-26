# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-tokenlib
_pkgname=tokenlib
pkgver=2.0.0
pkgrel=1
pkgdesc="Generic library for managing signed authentication tokens"
arch=('any')
url="https://github.com/mozilla-services/tokenlib"
license=('MPL2')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/66/17/147b29c8fe58e84df567b5120d72a15a760369b6d80349c1d6317e9ed30c/tokenlib-${pkgver}.tar.gz")
sha512sums=("ab17994f85676ff304b30d6f9480ebe681d82e61c11b331cb6b662100e4fb28b160ebc1dcf2f73620829a552ccdb3d6feb2850deabef9c63b6affc1210ae2078")

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

