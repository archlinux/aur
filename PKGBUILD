# Contributor: ReNoM <renom@list.ru>
# fix garynych <garynych@yandex.ru>

pkgname=paromtv
pkgver=20160202
pkgrel=1
pkgdesc="Client for free online TV - Parom.TV."
 
arch=("i686" "x86_64")
 
url="http://www.parom.tv/"
license=("custom")
 
depends=('vlc' 'qt4')

arch=`uname -m`

case "$arch" in
	"i686")
		source=("http://ru.parom.tv/download/linux/paromplayer-i386.deb")
		sha256sums=("6d011bd8fb8b3440257ceeb52f67f330ad079ca30f54c95169245e5ca3b6ce4c")
		;;
	"x86_64")
		source=("http://ru.parom.tv/download/linux/paromplayer-x86-64.deb")
		sha256sums=("c1afb3e2f7d67b8f63bcaea63b5345268419717ee49a9de3be2cc92b96dbab96")
		;;
	*)
		echo "Unsupported arch: $arch"
		exit 1
		;;
esac

build () {
	cd "$srcdir"
	tar xzvf data.tar.gz 
}

package () {
	mv "$srcdir"/usr/ "$pkgdir"
}
