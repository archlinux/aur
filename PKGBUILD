# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=spadfs-utils
pkgver=1.0.12
pkgrel=1
pkgdesc="SPAD filesystem userspace utilities"
arch=(x86_64)
url="https://artax.karlin.mff.cuni.cz/~mikulas/vyplody/spadfs/"
license=(unknown)
source=(https://artax.karlin.mff.cuni.cz/~mikulas/vyplody/spadfs/download/spadfs-${pkgver}.tar.gz)
sha256sums=('e48260effd75d8773eca2e1732412dbadf6861963782a0d1fa542e4464387565')

package() {
	cd spadfs-${pkgver}

	make mkspadfs spadfsck

	install -Dm0755 mkspadfs -t "${pkgdir}"/usr/bin
	install -Dm0755 spadfsck -t "${pkgdir}"/usr/bin
	ln -s /usr/bin/mkspadfs "${pkgdir}"/usr/bin/mkfs.spadfs
	ln -s /usr/bin/spadfsck "${pkgdir}"/usr/bin/fsck.spadfs

	install -Dm0644 {README,INTERNALS,ChangeLog} -t "${pkgdir}"/usr/share/doc/${pkgname}
}
