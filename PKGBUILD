# Maintainer: Leonidas P. <jpegxguy at outlook dot com>

_pkgname=ksmbd
pkgname=ksmbd-dkms
pkgver=3.4.6
pkgrel=1
pkgdesc="In-kernel SMB server, with the primary goal of improved I/O performance."
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/cifsd-team/ksmbd"
license=('GPL2')
depends=('dkms')
provides=('KSMBD-MODULE')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("d742992692dbe164060d2a0ea668895ed2b86252f10427db3d3a002df44c445b")

prepare() {
	sed -e "s/@VERSION@/${pkgver}/" -i "${_pkgname}-${pkgver}/dkms.conf"
}

package() {
	mkdir -p "${pkgdir}/usr/src"
	cp -r "${_pkgname}-${pkgver}" "${pkgdir}/usr/src/"
}
