# Maintainer: Jacob Mischka <jacob@mischka.me>

pkgname=firebase-admin
_foldername='Firebase Admin'
pkgver=1.0.0
pkgrel=3
pkgdesc='Firebase Management Cross Platform Application.'
url='https://firebaseadmin.com/'
license=('GPL3')
source=('https://firebaseadmin.com/download.php?file=1.0.0/firebase-admin-linux-1.0.0.zip'
		'firebase-admin.desktop'
		'logo.svg')
arch=('any')
md5sums=('9e28e19fe8cdbf5d3f513067eea0f9f4'
         'c9d43aeed4b00d02cb0987fbc408f056'
         'b995da0abde8e7766edb76cbc82578c5')

package(){
	mv logo.svg "$_foldername"
	mv "$_foldername/$_foldername" "$_foldername/$pkgname"
	install -dm755 "$pkgdir/opt/"
	cp -a --reflink=auto "$_foldername" "$pkgdir/opt/$pkgname/"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -dm755 "$pkgdir/usr/share/applications"
	install -Dm755 "$pkgname".desktop "$pkgdir/usr/share/applications/"
}
