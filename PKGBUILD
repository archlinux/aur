# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=slimbookamdcontroller
pkgver=0.3
pkgrel=1
pkgdesc="Application for the performance management of AMD processors"
arch=('any')
url="https://slimbook.es"
license=('GPL')
depends=('dbus-python' 'libappindicator-gtk3' 'libnotify' 'python-gobject'
         'python-pillow' 'ryzenadj' 'systemd-libs')
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('0d38da3e0ffa07c12a8717c520edc2550670f4841e2602a983c495a289e6acd1')

package() {
	bsdtar xf data.tar.xz -C "$pkgdir"

	ln -s /usr/bin/ryzenadj "$pkgdir/usr/share/$pkgname"
	chmod +x "$pkgdir/usr/lib/systemd/system-sleep/$pkgname"
}
