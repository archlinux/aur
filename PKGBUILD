pkgname=system-config-nfs
pkgdesc="A tool that lets you change the NFS server settings as well as manage the directories you want to share per NFS from your computer."
pkgver=1.4.3
pkgrel=2
fedoraversion=23
fedorarelease=1
arch=('i686' 'x86_64')
url="https://fedoraproject.org/wiki/SystemConfig/nfs"
license=('GPL')
# Get latest binary from http://pkgs.org/search/system-config-nfs
source=("http://dl.fedoraproject.org/pub/fedora/linux/development/${fedoraversion}/i386/os/Packages/s/system-config-nfs-${pkgver}-${fedorarelease}.fc${fedoraversion}.noarch.rpm"
	"system-config-nfs"
	"system-config-nfs.desktop")
md5sums=('0bd2ca1fe887c5c42040b5704504b9ef'
	'10cebcb296f60d885f596db5dcbe6104'
	'87c8cf8da6f5944924ec4a2732cb3979')
depends=('python2')

package() {
	rm $srcdir/usr/bin/system-config-nfs
	cp system-config-nfs $srcdir/usr/bin/
	rm $srcdir/usr/share/applications/system-config-nfs.desktop
	cp system-config-nfs.desktop $srcdir/usr/share/applications/
	cp -r $srcdir/* $pkgdir
}