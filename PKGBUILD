# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-cornice
_pkgname=cornice
pkgver=3.1.0
pkgrel=1
pkgdesc="Define Web Services in Pyramid"
arch=('any')
url="https://github.com/mozilla-services/cornice"
license=('MPL2')
depends=('python2')
source=("https://pypi.python.org/packages/4d/4c/efa48ece659eff1a0aed58cf0ca745a2cf30695e5473bf915612682822a5/${_pkgname}-${pkgver}.tar.gz")
sha512sums=("74eb73d74572f0ce33f6d8b0feae3e6468bf4df6b07bc4699bc0bbb9a0350039dd371e730823eeab32113b6d7eb05373d0800a6188c7a76f170f21f4d859527b")

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

