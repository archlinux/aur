# Maintainer: Jonathan Liu <net147@gmail.com>
# Contributors: Bidossessi Sodonon, Dan Serban, Herve Cauwelier, Tocer Deng
pkgname=openerp-client
pkgver=6.1_1
pkgrel=5
pkgdesc="OpenERP GTK client"
url="http://openerp.com/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('glade' 'gts' 'graphviz' 'hippo-canvas' 'python2' 'python2-dateutil' 'python2-egenix-mx-base' 'python2-lxml' 'python2-matplotlib' 'python2-pydot' 'python2-pyparsing' 'python2-pytz' 'python2-setuptools')
source=("https://nightly.odoo.com/old/openerp-6.1/6.1.0/${pkgname}-6.1-1.tar.gz"
        "openerp-client.desktop")
install="${pkgname}.install"
md5sums=('f0d349bfa0f1d8979b36a64bd5204b0c'
         '40e42be1e85eabdaca6e2d471f7e5c54')

package()
{
  cd "${srcdir}/${pkgname}-${pkgver//_/.}"
  python2 setup.py install --root="${pkgdir}"
  install -D -m 644 "${srcdir}/openerp-client.desktop" "${pkgdir}/usr/share/applications/openerp-client.desktop"
}
