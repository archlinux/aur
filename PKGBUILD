# Maintainer: CTech <ctech.exe@gmail.com>

pkgname=storm-launcher-git
_pkgname=stormLauncher
pkgver=1.0.0
pkgrel=2
pkgdesc="Software to control Dream Cheeky O.I.C Storm & Thunder USB Missile Launchers"
arch=('i686' 'x86_64')
url="https://github.com/7CTech/stormLauncher"
license=('GPL2')
depends=('python' 'python2' 'python-pygame' 'python-imaging' 'python-pillow' 'python-pyusb' 'tk' )
makedepends=('git')
provides=('stormLauncher')
source=("$pkgname::git+https://github.com/7CTech/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  mv stormLauncher.py stormLauncher
  chmod +x stormLauncher
}

package() {
  cd "$pkgname"
  install -Dm755 stormLauncher 		"$pkgdir/usr/bin/stormLauncher"
  install -Dm644 stormLauncher.png 	"$pkgdir/etc/stormLauncher/stormLauncher.png"
  install -Dm644 warcry.wav 		"$pkgdir/etc/stormLauncher/warcry.wav"
  install -Dm644 USAGE	 		"$pkgdir/usr/share/doc/stormLauncher/USAGE"
}
