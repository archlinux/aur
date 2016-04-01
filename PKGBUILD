# Maintainer: CTech <ctech.exe@gmail.com>

pkgname=storm-launcher
_pkgname=stormLauncher
pkgver=1.4.1
pkgrel=3
pkgdesc="Software to control Dream Cheeky O.I.C Storm & Thunder USB Missile Launchers"
arch=('any')
url="https://github.com/7CTech/stormLauncher"
license=('ASF 2.0')
depends=('python' 
	'python-pygame' 
	'python-imaging' 
	'python-pillow' 
	'python-pyusb' 
	'tk'
	'gksu')
conflicts=('storm-launcher-git')
source=("$pkgname-$pkgver.zip::https://github.com/7CTech/$_pkgname/archive/$pkgver.zip")
sha256sums=('df497e28068b6c34856ae622a503a693623b89602a466e1eec6977d5defe4a11')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  mv "$_pkgname".py "$_pkgname"
  chmod +x "$_pkgname"
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 stormLauncher 		"$pkgdir/usr/bin/storm-launcher"
  install -Dm644 stormLauncher.png 	"$pkgdir/usr/share/storm-launcher/storm-launcher.png"
  install -Dm644 Icon.png			"$pkgdir/usr/share/storm-launcher/Icon.png"
  install -Dm644 USBLauncher.desktop 	"$pkgdir/usr/share/applications/USBLauncher.desktop"
  install -Dm644 USAGE	 		"$pkgdir/usr/share/doc/storm-launcher/USAGE"
}
