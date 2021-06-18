# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>

pkgname=gnome-shell-extension-no-overview
pkgver=8
pkgrel=1
pkgdesc='Disable the start up overview in Gnome 40'
arch=('any')
url='https://github.com/fthx/no-overview'
license=('GPL3')
depends=(gnome-shell-extensions)
makedepends=('jq')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fthx/no-overview/archive/v${pkgver}.tar.gz")
sha256sums=('de521b05e19839549a3f581fa1e0f99b9f902236eb976a849430854e89933873')

package() {
	cd no-overview-${pkgver}
	uuid=$(jq -r '.uuid' metadata.json)
	destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
	mkdir -p "${destdir}"
	cp -a metadata.json extension.js "${destdir}"
}
