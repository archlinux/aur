# Maintainer: Snehit Sah <snehitsah@protonmail.com>
# Contributor: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-bin
_pkgname=maptool
pkgver=1.18.5
pkgrel=1
pkgdesc="An open source virtual tabletop program"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
optdepends=('gvfs: access virtual filesystem')
provides=('maptool')
conflicts=('maptool')
source=("https://github.com/RPTools/maptool/releases/download/${pkgver}/maptool_${pkgver}-amd64.deb")
sha256sums=('32f26e9f1e03df8ef7a3425e664d8df41fe0474c77354d1fdc220ea1be60669c')

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
