# Wiesław Magusiak <w.magusiak@gmail.com>
pkgname=arch-headless
pkgver=1.10
pkgrel=1
pkgdesc="Modify your arch ISO for a headless (and keyboardless) computer."
arch=('i686' 'x86_64')
url="http://github.com/wiemag/arch-headless"
license=('GPL')
groups=()
depends=('squashfs-tools' 'cdrkit' 'coreutils' 'grep' 'which')
#squashfs-tools: unsquashfs, mksquashfs
#cdrkit: 		 genisoimage
#coreutils: 	 md5sum, echo, date
#grep: 			 grep
#which: 		 which
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/wiemag/arch-headless/archive/v${pkgver}.tar.gz)
noextract=()
md5sums=('3f23216117f07a71735afdca6639d669')
package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	install -d -m 755 ${pkgdir}/usr/bin
	install -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -d -m 755 ${pkgdir}/usr/share/man/man1
	install -D -m 644 ${pkgname}.man ${pkgdir}/usr/share/man/man1/${pkgname}.1
}
