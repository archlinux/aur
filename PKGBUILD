# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

pkgname=museeks
pkgver=0.6.3
pkgrel=1
pkgdesc="A lightweight music player, cross-platform, written with Node.js, Electron and React.js."
arch=("x86_64" "i686")
url="http://museeks.io/"
license=('MIT')
#makedepends=('')
#depends=('')
source=("$pkgname.desktop")
source_x86_64=("https://github.com/KeitIG/$pkgname/releases/download/$pkgver/$pkgname-linux-x64.zip")
source_i686=("https://github.com/KeitIG/$pkgname/releases/download/$pkgver/$pkgname-linux-ia32.zip")
md5sums=('d1e55c28507b9cde3e1899c6f5b813e6')
md5sums_x86_64=('85b6919f4206687ab776d09edf78a754')
md5sums_i686=('0665822acef36c54dfd03dc38759011f')

if [ "$(uname -m)" = "x86_64" ]; then
	_arch=x64
elif [ "$(uname -m)" = "i686" ]; then
	_arch=ia32
fi

package() {
	mkdir -p $pkgdir/{opt/museeks,usr/{bin,share/applications}}
	cd $srcdir/$pkgname-linux-$_arch
	cp -R * $pkgdir/opt/museeks
	ln -s /opt/museeks/Museeks $pkgdir/usr/bin/museeks
	cp $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

