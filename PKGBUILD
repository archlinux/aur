# Maintainer: Brodi <me@brodi.space>

_plugin=file-sharing
pkgname=cockpit-${_plugin}
pkgver=3.2.0
pkgrel=1
pkgdesc="A Cockpit plugin to easily manage samba and NFS file sharing."
arch=("any")
url="https://github.com/45Drives/cockpit-file-sharing"
license=("GPL3")
depends=("cockpit" "python" "samba" "nfs-utils")
makedepends=("cockpit" "make")
provides=("${pkgname}")
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("a4548f8051932b7f0a74c1ca4b787646884f423b4ba146a737d3dc7e039f0a31c41fb3390fc9e71af8cbcbea966cffd43622668f17fcfe720c164b6f712f44a9")

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	install -d ${pkgdir}/usr/share/cockpit/${_plugin}/
	cp -rpf ./${_plugin}/* ${pkgdir}/usr/share/cockpit/${_plugin}/
}
