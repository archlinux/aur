# Contributor: deadc <deadcow@archlinux.com.br>
# Maintainer: N.Izumi aka izmntuk
pkgname=ncompress
pkgver=4.2.4.4
pkgrel=2
pkgdesc="The classic unix compression utility which can handle the ancient .Z archive"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/${pkgname}"
license=('GPL')
provides=('compress')
depends=('glibc')
source=("https://mirrors.kernel.org/gentoo/distfiles/${pkgname}-${pkgver}.tar.gz")
md5sums=('4be215caacf3d082bfe24cfdbaba538e')

build() {
	make -C "${pkgname}-${pkgver}"
}
package() {
	cd "${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
	install -dm755 "${pkgdir}/usr/share/man/man1"
	install -m644 Acknowleds "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 Changes "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 LZW.INFO "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 README "${pkgdir}/usr/share/doc/${pkgname}"
	install -m755 compress "${pkgdir}/usr/bin"
	install -m644 compress.1 "${pkgdir}/usr/share/man/man1"
}
