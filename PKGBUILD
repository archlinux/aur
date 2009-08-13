# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake-par
pkgver=0.03.01
pkgrel=1
pkgdesc="Quake PAK archiving utility."
url="ftp://ibiblio.org/pub/linux/games/quake/"
license="GPL"
depends=('glibc')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("ftp://ibiblio.org/pub/linux/games/quake/par-$pkgver.tar.gz")
md5sums=('39a73b5b95b04067dfc9acb8ef6bc9ff')

build() {
	cd $startdir/src/par-$pkgver
	
	# Modify Destination Directory in Makefile
	/bin/sed -i "s:/usr/local:$startdir/pkg/usr:" Makefile.Linux

	# Create Dirs
	install -d $startdir/pkg/usr/{bin,man/man1}

	./configure
	make || return 1
	make install
}
