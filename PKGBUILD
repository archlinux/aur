# Maintainer: Henrique Lecco <henriquealmeidalecco@gmail.com>
pkgname=lightdm-gtk-backgroundmatch
pkgver=1.0.0
pkgrel=1	
pkgdesc="Tool for matching the lightdm-gtk-greeter background to xfce4"
arch=('x86_64')
url="https://github.com/hlecco/lightdm-gtk-backgroundmatch"
license=('GPL')
depends=('lightdm' 'lightdm-gtk-greeter' 'xfdesktop')
md5sums=('3b425542a55030a90aa3d7d249bd9d99')
source=("https://github.com/hlecco/$pkgname/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 lightdm-gtk-backgroundmatch "$pkgdir/usr/bin/lightdm-gtk-backgroundmatch"
	install -Dm644 lightdm-gtk-backgroundmatch.conf "$pkgdir/etc/lightdm/lightdm-gtk-backgroundmatch.conf"
	install -Dm644 lightdm-gtk-backgroundmatch.service "$pkgdir/usr/lib/systemd/system/lightdm-gtk-backgroundmatch.service"
}
