# Contributor: ReNoM <renom@list.ru>
pkgname=paromtv
pkgver=20150126
pkgrel=1
pkgdesc="Client for free online TV - Parom.TV."
 
arch=("i686" "x86_64")
 
url="http://www.parom.tv/"
license=("custom")
 
depends=("vlc" "qt4")

arch=`uname -m`

case "$arch" in
	"i686")
		source=("http://ru.parom.tv/download/linux/paromplayer-i386.deb")
		sha256sums=("8483a88b225ea58969fcf033e065767012b6f7d5899145b34f27a98b6db57284")
		;;
	"x86_64")
		source=("http://ru.parom.tv/download/linux/paromplayer-x86-64.deb")
		sha256sums=("cbb5fbffa13697b67c38a89c54ce9d0ad0b5ff7c698a333711cf147c8555ea86")
		;;
	*)
		echo "Unsupported arch: $arch"
		exit 1
		;;
esac

build () {
	cd "$srcdir"
	tar Jxvf data.tar.xz
	rm usr/bin/.gitignore
}

package () {
	mv "$srcdir"/usr/ "$pkgdir"
}