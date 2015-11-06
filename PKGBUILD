# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
pkgname=git-dpm
pkgver=0.9.1
pkgrel=1
pkgdesc="debian source package and patch management with git"
arch=('any')
url="https://git-dpm.alioth.debian.org/"
license=('GPL2')
depends=('dpkg'
         'git')
makedepends=('ghostscript')
optdepends=('devscripts: for enhanced debian development workflow support'
            'bzip2: for bzip2 support'
	    'xz: for xz support'
	    'sensible-utils: sensible alternative selection support'
	    'pristine-tar: for re-generating upstream tarballs out of git'
	    'sharutils: for generating shell archives support')
source=("http://httpredir.debian.org/debian/pool/main/g/$pkgname/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('66063ef7d83b9b865db1547f9dc1c6e96080d1d116d1b2abefdd074d9bbc9fc4')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
