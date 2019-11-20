# Maintainer: Vinicius Correa <vinicius.correa at zoho dot com>

pkgname=stoq
pkgver=3.1.0
pkgrel=1
pkgdesc="Suite of open-source enterprise management"
arch=('any')
url="https:www.stoq.com.br"
license=('GPL')
depends=('python' 'python-zope-interface' 'python-kiwi-gtk' 'python-psycopg2' 'python-stoqdrivers' 'python-pillow' 'python-reportlab' 'python-dateutil' 'python-mako' 'python-lxml' 'python-xlwt' 'python-nss' 'python-storm' 'python-weasyprint' 'python-requests' 'python-pyopenssl' 'python-pyinotify' 'python-viivakoodi' 'python-pykcs11' 'python-raven' 'python-cryptography' 'python-qrcode' 'python-blinker' 'python-future' 'python-gobject' 'gtk3' 'webkitgtk' 'postgresql-libs')
optdepends=('postgresql')
source=("https://pypi.python.org/packages/source/s/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('778cd8d3cf48bb8db4029b01a140f2be')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
