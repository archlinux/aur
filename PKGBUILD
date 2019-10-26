# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-konfig
_pkgname=konfig
pkgver=1.1
pkgrel=1
pkgdesc="Yet Another Config Parser"
arch=('any')
url="https://github.com/mozilla-services/konfig"
license=('MPL2')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/3d/0c/2d61f29390063d9aabd20f1859b846faeb9e82711aae1ad92c5663264b00/${_pkgname}-${pkgver}.tar.gz")
sha512sums=("145441ac0bd8882a2d20a911291a597ec86f1a52ba3c23f6241cdc3e5beb474c25dbcbbd5cbe22308eafeb4c7ea0528d721fc9c1d9ba1884793f5e5cbeead6b3")

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

