# Maintainer: Brodi <me@brodi.space>

_plugin=file-sharing
pkgname=cockpit-${_plugin}
pkgver=2.4.5
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
sha512sums=("d87b8d658666c5cd5e12ecd10c40d78a5615259d80c655c98c1db9f390f90505ea4a91815d08db9349c13fe2d6bb6cdc90bc9c4a43ba5edaad343d9963533541")

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	install -d ${pkgdir}/usr/share/cockpit/${_plugin}/
	cp -rpf ./${_plugin}/* ${pkgdir}/usr/share/cockpit/${_plugin}/
}
