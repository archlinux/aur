# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

pkgname=museeks
pkgver=0.7.0
pkgrel=1
pkgdesc="A lightweight music player, cross-platform, written with Node.js, Electron and React.js."
arch=("x86_64" "i686")
url="http://museeks.io/"
license=('MIT')
source=("$pkgname.desktop")
source_x86_64=("https://github.com/KeitIG/$pkgname/releases/download/$pkgver/$pkgname-linux-x64.zip")
source_i686=("https://github.com/KeitIG/$pkgname/releases/download/$pkgver/$pkgname-linux-ia32.zip")
md5sums=('fc75f8975a145a1a98d3de5e6f0e4bef')
md5sums_x86_64=('501b0274caa7d4a6519a50d2434c6a0b')
md5sums_i686=('ea4634520d896389683e3496a054b26f')

if [ "$(uname -m)" = "x86_64" ]; then
	_arch=x64
elif [ "$(uname -m)" = "i686" ]; then
	_arch=ia32
fi

package() {
	mkdir -p $pkgdir/{opt/museeks,usr/{bin,share/applications}}
	cd $srcdir/Museeks-linux-$_arch
	cp -R * $pkgdir/opt/museeks
	ln -s /opt/museeks/Museeks $pkgdir/usr/bin/museeks
	cp $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

