# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
# Contributor: Mariel de Jesus™ <marieldejesus12 at gmail dot com>
pkgname=stoq
_pkgver=3.0
pkgver=3.0~rc3
pkgrel=1
pkgdesc="Suite of open-source enterprise management"
arch=('any')
url="https://github.com/stoq/${pkgname}"
license=('LGPL')
depends=('python' 'python-zope-interface' 'python-stoq-kiwi' 'python-psycopg2' 'python-stoqdrivers' 
'python-pillow' 'python-reportlab' 'postgresql-libs' 'python-dateutil' 'python-mako' 'libgudev' 'poppler'
'webkitgtk' 'librsvg' 'iso-codes' 'python-lxml' 'python-xlwt' 'python-nss' 'python-storm' 'python-weasyprint'
'python-requests' 'python-pyopenssl' 'python-pyinotify' 'libxss' 'ntp' 'python-viivakoodi' 'nss' 'libusb'
'python-pykcs11' 'python-pytz' 'python-raven' 'python-pdfrw')
makedepends=('git')
optdepends=('postgresql')
source=("https://launchpad.net/~stoq-dev/+archive/ubuntu/stoq3/+sourcefiles/${pkgname}/${pkgver}-2bionic/${pkgname}_${pkgver}-2bionic.tar.gz")
md5sums=('6e9f0f5783d489e681b5f76fe1026f33')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}.0rc3"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}.0rc3"
  python setup.py install --root="${pkgdir}" --optimize=1
}
