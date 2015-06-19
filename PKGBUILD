# Maintainer: Nick Østergaard <oe.nick@gmail.com>
# Contribuator: Zach Jaggi <feilen@fluffybutt.in>

pkgname=replicatorg
pkgver=0040
pkgrel=1
pkgdesc="ReplicatorG is a simple, opensource 3D printing program"
arch=('i686' 'x86_64')
license=('GNU GPL v2')
conflicts=('')
url="http://replicat.org"
depends=('java-runtime' 'python' 'tk')
optdepends=('psyco: speed up toolpath generation')
source=("http://replicatorg.googlecode.com/files/replicatorg-${pkgver}-linux.tgz"
#	'91-makerbot.rules'
	'replicatorg')

# removing 91-makerbot.rules, because system-udevd says
# (journalctl /usr/lib/systemd/systemd-udevd -b)
# systemd-udevd[141]: unknown key 'SYSFS{idVendor}' in /etc/udev/rules.d/91-makerbot.rules:1
# systemd-udevd[141]: invalid rule '/etc/udev/rules.d/91-makerbot.rules:1'

md5sums=('9e7171a32013edfd9bcf18330cdc20a1'
         '4993a15231df8dbcc16449d19479b284')
build() {
	cd ${srcdir}/replicatorg-${pkgver}/
	echo "Nothing to do here!"
}

package() {
    cd "${srcdir}/replicatorg-${pkgver}"
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/opt/replicatorg/
#    mkdir -p ${pkgdir}/etc/udev/rules.d/

#    install -m 644 ${srcdir}/91-makerbot.rules ${pkgdir}/etc/udev/rules.d/
    install -m 755 ${srcdir}/replicatorg ${pkgdir}/usr/bin/
    cp -r ${srcdir}/replicatorg-${pkgver}/* ${pkgdir}/opt/replicatorg/
    chown -R root:users ${pkgdir}/opt/replicatorg
    
}

# vim:set ts=4 sw=4 et:
