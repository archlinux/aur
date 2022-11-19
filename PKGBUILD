# Maintainer: Brodi <me@brodi.space>

_plugin=file-sharing
pkgname=cockpit-${_plugin}
pkgver=3.2.9
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
sha512sums=('2c084d03dc4d352979e1f50c87416a371c2963f10c5d40656fd78a2cd128ab54850273303110419d265f1b9d6872b9157a329325e5473ef95e127be9287b8b1d')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	install -d ${pkgdir}/usr/share/cockpit/${_plugin}/
	cp -rpf ./${_plugin}/* ${pkgdir}/usr/share/cockpit/${_plugin}/
}
