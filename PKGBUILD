# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-community-beta'
pkgver='1.20.0beta.9'
pkgrel='2'
pkgdesc='The official GUI for MongoDB - Community Edition (beta version)'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('electron3-bin' 'krb5' 'libsecret')
source=("$pkgname-$pkgver-$pkgrel::https://downloads.mongodb.com/compass/beta/mongodb-compass-community-beta-1.20.0-beta.9.x86_64.rpm"
		'launch.sh')
sha256sums=('6c375ea88d42084724cd491d3d81e1cb4a01b180cb86f89df8eb057cb21f5a98'
            '1bf3dd5e9363e750f4099acab9c8e22af7dc8645215d3fc4ed13abb0d38c5137')

package() {
	cd "$srcdir/"
	install -Dm644 "usr/share/$pkgname/resources/app.asar" "$pkgdir/usr/lib/$pkgname/app.asar"
	install -dm755 "$pkgdir/usr/lib/$pkgname/app.asar.unpacked/"
	cp -r --no-preserve=ownership --preserve=mode "usr/share/$pkgname/resources/app.asar.unpacked/"* "$pkgdir/usr/lib/$pkgname/app.asar.unpacked/"
	install -Dm755 "launch.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "usr/share/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "usr/share/$pkgname/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
	install -Dm644 "usr/share/applications/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "usr/share/pixmaps/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
