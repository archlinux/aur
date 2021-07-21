# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgdesc='Nextcloud app that allows admins to pre-generate previews.'
pkgname=('nextcloud-app-previewgenerator')
pkgver=3.1.1
pkgrel=2
arch=('any')
license=('AGPL')
url="https://github.com/rullzer/previewgenerator"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("previewgenerator-${pkgver}.tar.gz::https://github.com/rullzer/previewgenerator/releases/download/v${pkgver}/previewgenerator.tar.gz")
sha256sums=('6bf229799a4b431b3468d9f5bcc386832028d20b80a7dd898a197b3141fc962d')

package() {
	sed 's/max-version="21"/max-version="22"/' -i previewgenerator/appinfo/info.xml
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/previewgenerator" "${pkgdir}/usr/share/webapps/nextcloud/apps/previewgenerator"
}
