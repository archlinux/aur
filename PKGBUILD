# Maintainer: Thomas Pulzer <t.pulzer at thesecretgamer dot de>
_pkgname=kopano-deskapp
pkgname=$_pkgname-bin
pkgver=1.2.78
pkgrel=1
pkgdesc="Desktop application for accessing the Kopano Groupware server."
arch=('x86_64' 'i686')
url="https://kopano.io"
license=('AGPL3')
provides=('kopano-deskapp')
options=(!strip docs !libtool !staticlibs emptydirs zipman purge !optipng !upx !debug)
source=("https://git.thesecretgamer.de/faldon/kopano-deskapp-bin/repository/archive.tar.gz?ref=v$pkgver-AUR")

package() {
	cd "kopano-deskapp-bin-v$pkgver-AUR-477383ccb49b3778c6ecd57fd445368f004f2e26"
	install -Ddm755 "$pkgdir/opt/$_pkgname"
	install -Ddm755 "$pkgdir/usr/bin"
	install -Ddm755 "$pkgdir/usr/share/applications"
	chmod -R +r *
	chmod +x linux/nwjs-linux-x64/deskapp linux/nwjs-linux-x64/lib linux/nwjs-linux-x64/lib/lib{ffmpeg,node,nw}.so linux/nwjs-linux-x64/locales
	cp -r linux/nwjs-linux-x64/* "$pkgdir/opt/$_pkgname"
	cp -r icons "$pkgdir/usr/share"
	cp resources/kopano-deskapp.desktop "$pkgdir/usr/share/applications/"
	ln -s "$pkdir/opt/$_pkgname/deskapp" "$pkgdir/usr/bin/kopano-deskapp"
}
md5sums=('06ee67f8ff022b4f681b2255aa5ac020')
