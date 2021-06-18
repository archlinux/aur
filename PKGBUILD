# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>

pkgname=gnome-shell-extension-no-overview
_pkgname=no-overview
pkgdesc='Disable the start up overview for GNOME Shell 40+'
url='https://github.com/fthx/no-overview'
pkgver=8
pkgrel=1
arch=('any')
license=('GPL3')
depends=(gnome-shell)
makedepends=('jq')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fthx/no-overview/archive/v${pkgver}.tar.gz")
sha256sums=('de521b05e19839549a3f581fa1e0f99b9f902236eb976a849430854e89933873')

package() {
	cd ${_pkgname}-${pkgver}
	uuid=$(jq -r '.uuid' metadata.json)
	destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
	mkdir -p "${destdir}"
	cp -a metadata.json extension.js "${destdir}"
}
