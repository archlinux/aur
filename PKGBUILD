# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Kevin Wilms <niemandausduisburg@gmx.net>
# picpgm author: Darron M Broad
pkgname=pickle
pkgver=5.01
pkgrel=1
epoch=
pkgdesc="The project was renamed from k8048. Is a programm for programm PICS."
arch=( "i686" "x86_64" )
url="http://wiki.kewl.org/"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("http://wiki.kewl.org/downloads/pickle-${pkgver}.tgz")
#source=("pickle.tar.xz")
noextract=()
sha256sums_x86_64=("3729a5a217757a59884d21b632c8e60e1637d94c282bcf5138d00260450f2b89")
#md5sums=("SKIP")
validpgpkeys=()

build() {
  cd "$srcdir/$pkgname"
  #cd "$srcdir/pickle/src"
  make linux
  }
package() {
	cd "$srcdir/$pkgname/src"
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
