# Maintainer: Thomas Pulzer <t.pulzer at thesecretgamer dot de>
_pkgname=kdeintegration
pkgname=kopano-deskapp-$_pkgname
pkgver=1.2.78
pkgrel=1
pkgdesc="KDE desktop integration for kopano-deskapp"
arch=('x86_64' 'i686')
url="https://kopano.io"
license=('AGPL3')
provides=('kopano-deskapp-kdeintegration')
depends=('kopano-deskapp')
source=("https://git.thesecretgamer.de/faldon/kopano-deskapp-bin/repository/archive.tar.gz?ref=v$pkgver-$_pkgname-AUR")

package() {
	cd "kopano-deskapp-bin-v$pkgver-$_pkgname-AUR-ec29fbeceaa11ce7bcd8f5b128d92a8ac257aaa1"
	chmod -R +r *
	chmod +x resources/kdeintegration/kopano-deskapp-sendto-wrapper.sh
	install -Ddm755 "$pkgdir/usr/bin"
	if [ -d "/usr/share/kde4/services/ServiceMenus" ]; then
		install -Ddm755 "$pkgdir/usr/share/kde4/services/ServiceMenus"
		cp resources/kdeintegration/kopano-deskapp-kdeattachmentcontextmenu.desktop "$pkgdir/usr/share/kde4/services/ServiceMenus/"
	fi
	if [ -d "/usr/share/kservices5/ServiceMenus" ]; then
		install -Ddm755 "$pkgdir/usr/share/kservices5/ServiceMenus"
		cp resources/kdeintegration/kopano-deskapp-kdeattachmentcontextmenu.desktop "$pkgdir/usr/share/kservices5/ServiceMenus/"
	fi
	cp resources/kdeintegration/kopano-deskapp-sendto-wrapper.sh "$pkgdir/usr/bin/kopano-deskapp-sendto-wrapper"
}
md5sums=('418ca64e69ea0d35283c766cbb9058c4')
