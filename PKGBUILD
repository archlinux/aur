# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-pyramid-hawkauth
_pkgname=pyramid_hawkauth
pkgver=2.0.0
pkgrel=1
pkgdesc="A Pyramid authentication plugin for HAWK"
arch=('any')
url="https://github.com/mozilla-services/pyramid_hawkauth"
license=('MPL2')
depends=('python2')
source=("https://pypi.python.org/packages/ac/4f/c393f0dc1f8e6c41f7588cde7bcceffcb505d1e09b39545e59db92b45504/pyramid_hawkauth-${pkgver}.tar.gz")
sha512sums=("d34a4a23ee13dc61aa8de813dc07879367f67c74441bc598d0e9025653065bd882e867a4e572ef87b99a05022b360d78b3ecd9eaa155bc956d5a7d2ffd4548e7")

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

