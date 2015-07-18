# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Previous maintainer: Daniel Apolinario <dapolinario@gmail.com>
# Contributor: Roman Timushev <romikt@gmail.com>
pkgname=gnome-defaults-list
pkgver=3.14.0
pkgrel=4
pkgdesc="default file associations for GNOME environment"
_ubuntuver=2ubuntu4
arch=('any')
url="http://packages.ubuntu.com/source/vivid/gnome-session"
license=('GPL' 'LGPL')
source=(http://archive.ubuntu.com/ubuntu/pool/main/g/gnome-session/gnome-session_$pkgver-$_ubuntuver.debian.tar.gz)
md5sums=('c4f3267e501465c7352f47a1d8c65727')

package() {
	install -d "$pkgdir/etc/gnome"
	install -d "$pkgdir/usr/share/applications"
	cp $srcdir/debian/defaults.list $pkgdir/etc/gnome/defaults.list
	# sed -i "s/libreoffice\-//g" $pkgdir/etc/gnome/defaults.list
	ln -s "/etc/gnome/defaults.list" "$pkgdir/usr/share/applications/"
}

