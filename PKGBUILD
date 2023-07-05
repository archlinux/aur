# Maintainer: Didrole <Didrole@gmail.com>

pkgname=cato-client-bin
pkgver=5.1.0.14
pkgrel=1
pkgdesc='VPN client from Cato Networks to connect to the Cato Cloud.'
arch=('x86_64')
url='https://clientdownload.catonetworks.com/'
license=('custom')
depends=('glibc' 'gcc-libs' 'zlib')
makedepends=('libarchive')

source=("https://clientdownload.catonetworks.com/public/clients/cato-client-install.deb")
sha256sums=('11c797f110e26bda2122b1d6367c4ae4599e0afd5bac0bf00794dbf999290b22')

package() {
	bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
	mv "${pkgdir}/lib/systemd" "${pkgdir}/usr/lib/"
	rmdir "${pkgdir}/lib/"
	mv "${pkgdir}/usr/sbin/cato-clientd" "${pkgdir}/usr/bin/"
	rmdir "${pkgdir}/usr/sbin/"
	rmdir "${pkgdir}/usr/local/lib/"
}
