# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=astah-uml-bin
pkgver=8.2.0.b743f7.0
pkgrel=1
url='https://astah.net/products/astah-uml'
pkgdesc='Lightweight and easy-to-use UML2.x modeler (Trial)'
arch=('any')
license=('custom')
depends=("java-runtime=8")
makedepends=('shared-mime-info'
		 	 'gtk-update-icon-cache'
		 	 'desktop-file-utils')
provides=('astah-uml')
conflicts=('astah-community' 'astah-professional')
install='astah-uml.install'
options=('!emptydirs')
source=("http://cdn.change-vision.com/files/astah-uml-8.2.0.b743f7-0.noarch.rpm")
sha256sums=('e384286a1b7cf0ed592d84be52c473652ff88716972e7235a8a4daddf0018f1f')

package() {
  cp -aR "${srcdir}/usr" "${pkgdir}"
  mkdir -p "${pkgdir}/opt/"
  mv "${pkgdir}/usr/lib/astah_uml" "${pkgdir}/opt/"
  mkdir -p "${pkgdir}/usr/share/doc/astah_uml/"
  mv "${pkgdir}/opt/astah_uml"/ReferenceManual-* "${pkgdir}/usr/share/doc/astah_uml/"
  mkdir -p "${pkgdir}/usr/share/licenses/astah_uml"
  mv "${pkgdir}/opt/astah_uml"/AstahLicenseAgreement-e.txt "${pkgdir}/usr/share/licenses/astah_uml/LICENSE"
  rm "${pkgdir}/usr/bin/astah-uml"
  ln -s /opt/astah_uml/astah-uml "${pkgdir}/usr/bin"
}