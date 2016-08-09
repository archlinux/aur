# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

pkgname=museeks
pkgver=0.6.0
pkgrel=1
pkgdesc="A lightweight music player, cross-platform, written with Node.js, Electron and React.js."
arch=("x86_64" "i686")
url="http://museeks.io/"
license=('MIT')
#makedepends=('')
#depends=('')
source=("$pkgname.desktop")
source_x86_64=('https://github.com/KeitIG/museeks/releases/download/0.6.0/museeks-linux-x64.zip')
source_i686=('https://github.com/KeitIG/museeks/releases/download/0.6.0/museeks-linux-ia32.zip')
md5sums=('d1e55c28507b9cde3e1899c6f5b813e6')
md5sums_x86_64=('9552e82aab69503588724fc1c1d33d40')
md5sums_i686=('e3adb0d0819b0a46cc025990ebc3c380')

if [ "$(uname -m)" = "x86_64" ]; then
	_arch=x64
elif [ "$(uname -m)" = "i686" ]; then
	_arch=ia32
fi

package() {
	mkdir -p $pkgdir/{opt/museeks,usr/{bin,share/applications}}
	cd $srcdir/$pkgname-linux-$_arch
	cp -R * $pkgdir/opt/museeks
	ln -s /opt/museeks/museeks $pkgdir/usr/bin/museeks
	cp $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

