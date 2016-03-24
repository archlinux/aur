# Maintainer: CTech <ctech.exe@gmail.com>

pkgname=storm-launcher
pkgver=1.3
pkgrel=2
pkgdesc="Software to control Dream Cheeky O.I.C Storm & Thunder USB Missile Launchers"
arch=('i686' 'x86_64')
url="https://github.com/7CTech/stormLauncher"
license=('ASF 2.0')
depends=('python' 
	'python-pygame' 
	'python-imaging' 
	'python-pillow' 
	'python-pyusb' 
	'tk'
	'gksu')
provides=('stormLauncher')
conflicts=('storm-launcher-git')
source=("$pkgname.zip::https://github.com/7CTech/stormLauncher/archive/$pkgver.zip")
sha256sums=('e437acbfff569ed4ac8cfc0de676408972fe40b9a364c99c3f0a2ca5c909f07b')

build() {
  cd "$srcdir/stormLauncher-$pkgver"
  mv stormLauncher.py stormLauncher
  chmod +x stormLauncher
}

package() {
  cd "$srcdir/stormLauncher-$pkgver"
  install -Dm755 stormLauncher 		"$pkgdir/usr/bin/stormLauncher"
  install -Dm644 stormLauncher.png 	"$pkgdir/etc/stormLauncher/stormLauncher.png"
  install -Dm644 Icon.png			"$pkgdir/etc/stormLauncher/Icon.png"
  install -Dm644 USBLauncher.desktop 	"$pkgdir/usr/share/applications/USBLauncher.desktop"
  install -Dm644 USAGE	 		"$pkgdir/usr/share/doc/stormLauncher/USAGE"
}
