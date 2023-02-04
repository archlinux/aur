# Maintainer: Leonidas P. <jpegxguy at outlook dot com>

_pkgname=ksmbd
pkgname=ksmbd-dkms
pkgver=3.4.7
pkgrel=1
pkgdesc="In-kernel SMB server, with the primary goal of improved I/O performance."
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/cifsd-team/ksmbd"
license=('GPL2')
depends=('dkms')
provides=('KSMBD-MODULE')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("bbfdbaae680b2cf8ced0e539292e7fc0ec15035e9fe8a1fe0b46e2f27ab774e8")

prepare() {
	sed -e "s/@VERSION@/${pkgver}/" -i "${_pkgname}-${pkgver}/dkms.conf"
}

package() {
	mkdir -p "${pkgdir}/usr/src"
	cp -r "${_pkgname}-${pkgver}" "${pkgdir}/usr/src/"
}
