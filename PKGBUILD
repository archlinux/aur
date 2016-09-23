# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

pkgname=museeks
pkgver=0.7.1
pkgrel=1
pkgdesc="A lightweight music player, cross-platform, written with Node.js, Electron and React.js."
arch=("x86_64" "i686")
url="http://museeks.io/"
license=('MIT')
source=("$pkgname.desktop")
source_x86_64=("https://github.com/KeitIG/$pkgname/releases/download/$pkgver/$pkgname-linux-x64.zip")
source_i686=("https://github.com/KeitIG/$pkgname/releases/download/$pkgver/$pkgname-linux-ia32.zip")
md5sums=('fc75f8975a145a1a98d3de5e6f0e4bef')
md5sums_x86_64=('fad75c7e06739b830fba5e3b8b1e9a89')
md5sums_i686=('1dd1b921d5a23acb0623ffa86ee0fb68')

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

