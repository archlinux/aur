# Maintainer: Sum01 https://github.com/sum01
pkgname=('vcash-electron')
pkgver=0.31.3
pkgrel=5
pkgdesc="Vcash GUI bundled with the Vcash wallet."
arch=('x86_64')
url="https://github.com/whphhg/vcash-electron"
license=('GPL3' 'AGPL3')
depends=('libxss' 'gconf')
provides=('vcash=0.63.0')
conflicts=('vcash')
backup=('~/.Vcash/' '~/.config/Vcash Electron GUI/')
source=("https://github.com/whphhg/vcash-electron/releases/download/v$pkgver/Vcash-Electron-GUI-$pkgver-linux64.zip"
				"https://github.com/whphhg/vcash-electron/raw/master/build/icons/16x16.png"
				"https://github.com/whphhg/vcash-electron/raw/master/build/icons/32x32.png"
				"https://github.com/whphhg/vcash-electron/raw/master/build/icons/48x48.png"
				"https://github.com/whphhg/vcash-electron/raw/master/build/icons/96x96.png"
				"https://github.com/whphhg/vcash-electron/raw/master/build/icons/128x128.png"
				"https://github.com/whphhg/vcash-electron/raw/master/build/icons/256x256.png"
				"vcash-electron.desktop")
sha256sums=('d7b90bd349fe6be1e08d34d28b170c2c60a6e468c2c36ecfc44da7d3f6705453'
						'c1737e5e05e153e95a743c7989df0dfe8c197e4159e8341ced9d6ca84ae99ab5'
						'2b4b19808cabb18820d802e4e26f0f587e73fc8a0fd78fb6f70a9337e8a4ad89'
						'747f9d0ae02f6e6b8bab6a04794f66c88e6a8b1a6d4c4af938c7aa12adb29c28'
						'e85907fb18237fd6abe5a4aa464a8e9869d8293fe5acb593e550c13005c893b9'
						'f215ece667efc575bf452c4ea720da15d759f346453b53f6aed01022cc968a1d'
						'5bb6e09574141d9e807fd04050bc800d7f5ae6413f5bfd9359fd095ef2e0ece2'
						'409aaf41391234ded7aed20e5d4839ad8c4d5d8d977d5a155811f4a146a9be4f')

package() {
	chmod a+x $srcdir/linux-unpacked/vcash-electron
	chmod a+x $srcdir/linux-unpacked/resources/app.asar.unpacked/bin/vcashd-x64
	mkdir -p $pkgdir/usr/{lib/$pkgname,share/{applications,icons/hicolor/{16x16,32x32,48x48,96x96,128x128,256x256}/apps}}/
	mv $srcdir/linux-unpacked "$pkgdir/usr/lib/$pkgname/Vcash Electron GUI"
	cp $srcdir/vcash-electron.desktop $pkgdir/usr/share/applications/
	cp $srcdir/16x16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/vcash.png
	cp $srcdir/32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/vcash.png
	cp $srcdir/48x48.png $pkgdir/usr/share/icons/hicolor/48x48/apps/vcash.png
	cp $srcdir/96x96.png $pkgdir/usr/share/icons/hicolor/96x96/apps/vcash.png
	cp $srcdir/128x128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/vcash.png
	cp $srcdir/256x256.png $pkgdir/usr/share/icons/hicolor/256x256/apps/vcash.png
}
