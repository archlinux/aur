# Maintainer: xo <xo@rotce.de>

pkgname=hashboot-git
pkgver=0.7.4
pkgrel=1
pkgdesc="A utility to check at boottime befor network, if /boot or mbr were manipulated."
arch=('i686' 'x86_64')
url="https://git.tastytea.de/?p=hashboot.git;a=summary"
license=('custom:"hugware"')
conflicts=('chkboot' 'mkinitcpio-chkcryptoboot')
depends=('bash' 'coreutils' 'tar' 'which' 'grep' 'gawk' 'util-linux' 'gzip')
source=(git+git://git.tastytea.de/repositories/hashboot.git)
md5sums=('SKIP')

package() {
	msg "Copy files"
	cd "$srcdir/hashboot"
	install -m755 -d "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 initscript.systemd "${pkgdir}/usr/lib/systemd/system/hashboot.service"
	install -Dm755 hashboot "${pkgdir}/usr/bin/hashboot"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/HUGWARE"
}
