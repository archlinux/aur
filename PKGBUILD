# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-mozsvc
_pkgname=mozsvc
pkgver=0.10
pkgrel=2
pkgdesc="Various utilities for Mozilla apps"
arch=('any')
url="https://github.com/mozilla-services/mozservices"
license=('MTI')
depends=('python2' 'python2-umemcache')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/b5/b9/bede16bafe144acfd96ffb99185ae3adac1bac8e642665ee08c9d429fcc4/${_pkgname}-${pkgver}.tar.gz")
sha512sums=("0a96eef28c135c649366ed2df70756eb0029c9a518ff7c5fa9f806c68797b66d0954bdb8fd491511c84e1bbcf4f3610388f2bc7b7801bb00a9c8ffc789815493")

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

