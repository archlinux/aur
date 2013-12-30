# Maintainer: Julien Savard <juju2143@gmail.com>

pkgname=supersonicball
pkgver=0.9.2
pkgrel=1
pkgdesc="The crazy ball tunnel game"
arch=('any')
url="http://julosoft.net/supersonicball/"
license=('GPL')
depends=('love')
makedepends=('unzip')
source=(${pkgname}.sh
        ${pkgname}.desktop
        http://files.julosoft.net/${pkgname}-${pkgver}.love)
sha1sums=('4515bad415633fce6174e54a871454c26af1848b'
          '1683f7d1827a28eefc8ff311e8bf59630a4837fc'
          '040f1c841e6147cfc7dfbb37e2494b2933549cfe')

build() {
	unzip -u "${srcdir}/${pkgname}-${pkgver}.love" README.md -d "${srcdir}"
}

package() {
	# Install Data
	install -D -m755 "${srcdir}/${pkgname}-${pkgver}.love" "${pkgdir}/usr/share/${pkgname}/${pkgname}.love"
	install -D -m644 "${srcdir}/README.md" "$pkgdir/usr/share/${pkgname}/README"

	# Install Launcher
	install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	# Install Desktop
	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
