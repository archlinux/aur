# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python2-x2go
_pkgbase=python-x2go
pkgver=0.5.0.4
pkgrel=2
pkgdesc="Python 2.x module providing X2Go client API"
url="http://www.x2go.org/"
arch=('any')
license=('AGPL')
makedepends=('python2' 'python2-setuptools' 'epydoc')
depends=('python2' 'python2-gevent' 'python2-paramiko' 'python2-requests'
         'python2-simplejson' 'python2-xlib' 'nxproxy')
source=("http://code.x2go.org/releases/source/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('db971e96cc32d10782fdfbce04f1f8316c63510872d03cae99842bf96e2ab6c9')

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  epydoc --name "Python X2Go" --url http://www.x2go.org --no-private \
    --html --quiet --output "${pkgdir}/usr/share/doc/${pkgname}" x2go/
}
