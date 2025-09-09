# Maintainer: Pavel Sibal <entexsoft@gmail.com>
pkgname=repair-usb-disc
pkgver=0.1
pkgrel=0
pkgdesc="Universal filesystem repair tool (NTFS/FAT32/exFAT/ext*/XFS/Btrfs)."
arch=('any')
url="https://gitlab.com/linux-stuffs/linux-goodies/-/tree/master/repair-usb-disc"
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('bash' 'ntfs-3g' 'dosfstools' 'exfatprogs' 'xfsprogs' 'btrfs-progs')
options=('!strip')
source=('https://gitlab.com/linux-stuffs/linux-goodies/-/raw/master/repair-usb-disc/distrib/repair-usb-disc-0.1-0.tar.gz')
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	./configure  --prefix=/usr
	make install DESTDIR="${pkgdir}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp --no-preserve=ownership "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
