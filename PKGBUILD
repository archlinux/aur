# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Previous maintainer: Daniel Apolinario <dapolinario@gmail.com>
# Contributor: Roman Timushev <romikt@gmail.com>
pkgname=gnome-defaults-list
pkgver=3.18.1.2
pkgrel=1
pkgdesc="default file associations for GNOME environment"
_ubuntuver=1ubuntu1.16.04.1
arch=('any')
url="http://packages.ubuntu.com/source/gnome-session"
license=('GPL' 'LGPL')
source=(http://archive.ubuntu.com/ubuntu/pool/main/g/gnome-session/gnome-session_${pkgver}-${_ubuntuver}.debian.tar.xz)
md5sums=('eadb3a9eb07358ef9b68ca7bf60444fd')

package() {
	install -d "$pkgdir/etc/gnome"
	install -d "$pkgdir/usr/share/applications"
	cp $srcdir/debian/defaults.list $pkgdir/etc/gnome/defaults.list
	# sed -i "s/libreoffice\-//g" $pkgdir/etc/gnome/defaults.list
	ln -s "/etc/gnome/defaults.list" "$pkgdir/usr/share/applications/"
}

