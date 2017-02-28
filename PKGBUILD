# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=cainteoir-gtk
pkgver=0.9
pkgrel=1
epoch=
pkgdesc="The Cainteoir Text-To-Speach Engine, GTK Frontend and ebook reader"
arch=(x86_64)
url="https://github.com/rhdunn/cainteoir-gtk"
license=('GPL')
groups=()
depends=(gtk3 caintenoir-engine)
makedepends=(intltool)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
"https://github.com/rhdunn/cainteoir-gtk/archive/$pkgname-$pkgver.tar.gz"
)
noextract=()
md5sums=(
4f409585591ad5ae5128f540de6070e8
)
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgname-$pkgver"
  #cp -R ucd-tools-8.0.0/* "$pkgname-$pkgname-$pkgver/ucd-tools"
  #sed -i 's/python/python2/g' "$pkgname-$pkgname-$pkgver/tools/fsm" 
}

build() {
	cd "$pkgname-$pkgname-$pkgver"
	./autogen.sh
  ./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgname-$pkgver"
	#make -k check
}

package() {
	cd "$pkgname-$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
  #cd $pkgdir/usr/share
  #rm -rf mime vim
}

