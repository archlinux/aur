# Contributor: gothicknight <gothicknight@gmail.com>
pkgname=netwox
pkgver=5.39.0
pkgrel=1
pkgdesc="Toolbox netwox helps to find and solve network problems."
url="http://www.laurentconstantin.com/en/netw/netwox/"
license=('GPL')
depends=('libpcap')
makedepends=('netwib' 'libnet')
arch=('i686' 'x86_64')
source=(
	"http://netcologne.dl.sourceforge.net/project/ntwox/netwox%20only/5.39/$pkgname-$pkgver-src.tgz"
)
md5sums=(
	'1bf65761b39fa8328f2d072fa526edce'
)

build(){
	cd "$pkgname-$pkgver-src/src"
	sed -i -e 's|/local||' -e 's|/man$|/share&|' config.dat
	./genemake
	make
	
}

package(){
	cd "$pkgname-$pkgver-src/src"
	make DESTDIR="$pkgdir/" install
}
