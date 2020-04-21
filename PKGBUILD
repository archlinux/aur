# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=astah-uml
pkgver=8.2.0.b743f7.0
pkgrel=1
url='https://astah.net/products/astah-uml'
pkgdesc='Lightweight and easy-to-use UML2.x modeler (Trial)'
arch=('any')
license=('custom')
depends=('java-runtime=8')
conflicts=('astah-community' 'astah-professional')
options=('!emptydirs')
source=("http://cdn.change-vision.com/files/astah-uml-${pkgver:0:12}-${pkgver:13}.noarch.rpm")
sha256sums=('e384286a1b7cf0ed592d84be52c473652ff88716972e7235a8a4daddf0018f1f')

package() {
  cp -aR "${srcdir}/usr" "${pkgdir}"
  mkdir -p "${pkgdir}/opt/"
  mv "${pkgdir}/usr/lib/astah_uml" "${pkgdir}/opt/astah-uml"
  mkdir -p "${pkgdir}/usr/share/doc/astah-uml/"
  mv "${pkgdir}/opt/astah-uml"/ReferenceManual-* "${pkgdir}/usr/share/doc/astah-uml/"
  mkdir -p "${pkgdir}/usr/share/licenses/astah-uml"
  mv "${pkgdir}/opt/astah-uml"/AstahLicenseAgreement-e.txt "${pkgdir}/usr/share/licenses/astah-uml/LICENSE"
  rm "${pkgdir}/usr/bin/astah-uml"
  ln -s /opt/astah-uml/astah-uml "${pkgdir}/usr/bin"
}