# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=slimbookamdcontroller
pkgver=0.3.1
pkgrel=1
pkgdesc="Application for the performance management of AMD processors"
arch=('any')
url="https://slimbook.es"
license=('GPL')
depends=('dbus-python' 'libappindicator-gtk3' 'libnotify' 'python-gobject'
         'python-pillow' 'ryzenadj' 'systemd-libs')
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('7c0d9ef43a0ba4b73f8cc21f20c83b8a904009610e03c6952324444191182f0f')

package() {
	bsdtar xf data.tar.xz -C "$pkgdir"

	ln -s /usr/bin/ryzenadj "$pkgdir/usr/share/$pkgname"
	chmod +x "$pkgdir/usr/lib/systemd/system-sleep/$pkgname"
}
