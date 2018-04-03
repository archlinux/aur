# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
# Contributor: Mariel de Jesus™ <marieldejesus12 at gmail dot com>
pkgname=stoq
pkgver=2.2
pkgrel=2
pkgdesc="Stoq Retail Management System."
arch=('any')
url="https://github.com/stoq/${pkgname}"
license=('LGPL')
depends=('python2' 'python2-service_identity' 'kiwi' 'stoqdrivers' 'ntp' 'python2-zope-interface' 'postgresql-libs' 
'python2-poppler' 'python2-weasyprint' 'python2-dateutil' 'python2-pillow' 'python2-gudev' 'python2-mako' 
'python2-psycopg2' 'python2-storm' 'pywebkitgtk' 'python2-xlwt' 'iso-codes' 'pygtk' 'python2-pyinotify' 
'python2-reportlab' 'python2-cairo' 'python2-twisted' 'python2-pyopenssl' 'python2-lxml' 'python2-cryptography' 
'python2-nss' 'python2-requests' 'python2-six' 'python2-tzlocal' 'python2-viivakoodi' 'python2-raven' 'python2-pykcs11')
makedepends=('git')
optdepends=('postgresql')
conflicts=('stoq-git')
#source=("https://github.com/stoq/${pkgname}/archive/${pkgver}.tar.gz")
source=("https://launchpad.net/~stoq-dev/+archive/ubuntu/lancamentos/+files/stoq_2.2-1artful.tar.gz")
md5sums=('02fb2a6938bad7c939122d8ab3441919')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}.0"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}.0"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

