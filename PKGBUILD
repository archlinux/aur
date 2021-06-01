# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=slimbookamdcontroller
pkgver=0.2
pkgrel=1
pkgdesc="Application for the performance management of AMD processors"
arch=('any')
url="https://slimbook.es"
license=('GPL')
depends=('dbus-python' 'libappindicator-gtk3' 'libnotify' 'python-gobject'
         'python-pillow' 'ryzenadj' 'systemd-libs')
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('ffb6d19556881d2511264eb943a97880fdc8e69d4f4e152153e7d1eb09593694')

package() {
	bsdtar xf data.tar.xz -C "$pkgdir"

	ln -s /usr/bin/ryzenadj "$pkgdir/usr/share/$pkgname"
	chmod +x "$pkgdir/usr/lib/systemd/system-sleep/$pkgname"
}
