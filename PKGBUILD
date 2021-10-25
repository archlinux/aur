# Maintainer: Piotr Balwierz
pkgname=bedtools
pkgver=2.30.0
pkgrel=1
pkgdesc='powerful toolset for genome arithmetic'
arch=('i686' 'x86_64')
url="https://github.com/arq5x/bedtools2"
license=('GPL2')
depends=('bash' 'zlib')
checkdepends=('python' 'samtools')
source=("https://github.com/arq5x/bedtools2/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('e6e87b4bcbda17348a1df2ff6386fccb8ec1f75b')

build()
{
	cd $srcdir/${pkgname}2
	make
}

#check disabled because it requires python and samtools. Uncomment if you wish.
#~ check()
#~ {
	#~ cd $srcdir/${pkgname}2
	#~ make test
#~ }

package()
{
	cd $srcdir/${pkgname}2
	for f in bin/*
	do
		install -Dm755 $f $pkgdir/usr/bin/$(basename $f)
	done
}

