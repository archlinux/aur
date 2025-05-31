# Maintainer: Snehit Sah <snehitsah@protonmail.com>
# Contributor: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-bin
_pkgname=maptool
pkgver=1.17.0
pkgrel=1
pkgdesc="An open source virtual tabletop program"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
optdepends=('gvfs: access virtual filesystem')
provides=('maptool')
conflicts=('maptool')
source=("https://github.com/RPTools/maptool/releases/download/${pkgver}/maptool_${pkgver}-amd64.deb")
sha256sums=('78e128f6da59a8f9ddc7a0bd37adf28e1dfdff5d44ac7e25710caab2efe87706')

package() {

	# extract .deb contents into directory structure
	tar -C ${pkgdir} -xf data.tar.zst

	# put things in expected places
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/etc
	install -Dm644 ${pkgdir}/opt/${_pkgname}/lib/${_pkgname}-MapTool.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
	ln -s /opt/${_pkgname}/bin/MapTool ${pkgdir}/usr/bin/MapTool
	ln -s /opt/${_pkgname}/lib/app/MapTool.cfg ${pkgdir}/etc/MapTool.cfg

}
