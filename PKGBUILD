# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Kevin Wilms <niemandausduisburg@gmx.net>
# picpgm author: Darron M Broad
pkgname=pickle-beta
_srcname=pickle
_buildversion=553bdcf35bdf
pkgver=5.02
pkgrel=1
epoch=
pkgdesc="The project was renamed from k8048. Is a programm for programm PICS. Beta Version."
arch=( "i686" "x86_64" )
url="http://wiki.kewl.org/"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('pickle')
replaces=('pickle')
backup=()
options=()
install=
changelog=
source_x86_64=("http://hg.kewl.org/pub/pickle/archive/tip.tar.gz")
#source=("pickle.tar.xz")
noextract=()
sha256sums_x86_64=("5e6e78f07804b925bbd42944436877ce4b776438dcd36c3a0b8d730af402b126")
#md5sums=("SKIP")
validpgpkeys=()

build() {
  cd "$srcdir/$_srcname-$_buildversion"
  #cd "$srcdir/pickle/src"
  make linux
  }
package() {
	cd "$srcdir/$_srcname-$_buildversion/src"
	#sudo make DESTDIR="${pkgdir} linux-install"
	install -Dm755 pickle "$pkgdir/usr/local/bin/pickle"
	install -Dm755 pctrl "$pkgdir/usr/local/bin/pctrl"
	install -Dm755 pio "$pkgdir/usr/local/bin/pio"
	install -Dm755 pload "$pkgdir/usr/local/bin/pload"
	install -Dm755 ptest "$pkgdir/usr/local/bin/ptest"
	ln -sf "/usr/local/bin/pickle" "$pkgdir/usr/local/bin/p12"
	ln -sf "/usr/local/bin/pickle" "$pkgdir/usr/local/bin/p14"
	ln -sf "/usr/local/bin/pickle" "$pkgdir/usr/local/bin/n14"
	ln -sf "/usr/local/bin/pickle" "$pkgdir/usr/local/bin/p16"
	ln -sf "/usr/local/bin/pickle" "$pkgdir/usr/local/bin/n16"
	ln -sf "/usr/local/bin/pickle" "$pkgdir/usr/local/bin/p24"
	ln -sf "/usr/local/bin/pickle" "$pkgdir/usr/local/bin/p32"
}
