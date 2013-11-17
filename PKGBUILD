# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=linux-minidisc
pkgver=0.9.10
pkgrel=1
pkgdesc='Free software for accessing MiniDisc devices'
arch=(i686 x86_64)
url='https://wiki.physik.fu-berlin.de/linux-minidisc/doku.php'
depends=('qt4' 'glib2' 'libgcrypt' 'libmad' 'sox' 'libid3tag' 'libusbx' 'taglib')
license=('GPL')
source=(https://github.com/glaubitz/$pkgname/archive/$pkgver.tar.gz)
md5sums=('27ef801a88c61fde8ba561d585308623')

build() {
	cd $pkgname-$pkgver
	qmake-qt4 -r
	make
}

package() {
	cd $pkgname-$pkgver
	make INSTALL_ROOT="$pkgdir" install
}
