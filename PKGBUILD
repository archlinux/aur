# Maintainer: Piotr Balwierz
# previous maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
pkgname=bedtools
pkgver=2.24.0
pkgrel=1
pkgdesc='powerful toolset for genome arithmetic'
arch=('i686' 'x86_64')
url="https://github.com/arq5x/bedtools2"
license=('GPL2')
depends=('bash' 'zlib')
checkdepends=('python')
source=("https://github.com/arq5x/bedtools2/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('268a5d47b00ec641217a6dfc96894ef6')

build()
{
	cd $srcdir/${pkgname}2
	make
}

check()
{
	cd $srcdir/${pkgname}2
	make test
}

package()
{
	cd $srcdir/${pkgname}2
	for f in bin/*
	do
		install -Dm755 $f $pkgdir/usr/bin/$(basename $f)
	done
}
