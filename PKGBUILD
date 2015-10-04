# Wiesław Magusiak <w.magusiak@gmail.com>
pkgname=arch-headless
pkgver=1.14
pkgrel=0
pkgdesc="Modify your arch ISO for a headless (and keyboardless) computer."
arch=('i686' 'x86_64')
url="http://github.com/wiemag/arch-headless"
license=('GPL')
groups=()
depends=('squashfs-tools' 'cdrkit' 'coreutils' 'grep' 'which' 'kbd' 'gawk' 'sed' 'util-linux')
#squashfs-tools: unsquashfs, mksquashfs
#cdrkit: 		 genisoimage
#coreutils: 	 md5sum, echo, date
#grep: 			 grep
#which: 		 which
#kbd:            loadkeys, setfont
#gawk:           awk
#sed:            sed
#util-linux:     mount, umount
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
md5sums=('4121e77baf2f237a82b785c5676da92f')
package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	install -d -m 755 ${pkgdir}/usr/bin
	install -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -d -m 755 ${pkgdir}/usr/share/man/man1
	install -D -m 644 ${pkgname}.man ${pkgdir}/usr/share/man/man1/${pkgname}.1
}
