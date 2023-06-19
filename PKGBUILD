# Maintainer: éclairevoyant
# Contributor: C dot Dominik Bódi <dominik dot bodi at gmx dot de>

pkgname=git-dpm
pkgver=0.10.0
pkgrel=1
pkgdesc="debian source package and patch management with git"
arch=(any)
url="https://tracker.debian.org/pkg/git-dpm"
license=(GPL2)
depends=(dpkg bash git)
makedepends=(ghostscript)
optdepends=(
	'bzip2: for bzip2 support'
	'devscripts: for enhanced debian development workflow support'
	'pristine-tar: for re-generating upstream tarballs out of git'
	'sensible-editor: sensible alternative selection support'
	'sharutils: for generating shell archives support'
	'xz: for xz support'
)
source=("https://ftp.debian.org/debian/pool/main/g/$pkgname/${pkgname}_${pkgver}.orig.tar.xz")
sha256sums=('ce03811429fecafb4c3eb159c27ffd5bbf86f0fd8f6866fa2e8aad2433d3c875')

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
