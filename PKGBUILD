# Maintainer: Graham Bell <graham dot s dot bell at gmail dot com>
pkgname=fitsverify
pkgver=4.17
pkgrel=1
pkgdesc="A FITS file format-verification tool"
arch=('i686' 'x86_64')
url="http://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/"
license=('unknown')
depends=('cfitsio')
source=("http://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/$pkgname-$pkgver.tar.gz")
md5sums=('e08671d137f49e4e8730d88babc5e875')

build() {
	cd "$srcdir/$pkgname"
        gcc -o fitsverify \
                ftverify.c fvrf_data.c fvrf_file.c fvrf_head.c \
                fvrf_key.c fvrf_misc.c \
                -DSTANDALONE \
                -lcfitsio
}

package() {
	cd "$srcdir/$pkgname"
        install -D fitsverify "$pkgdir/usr/bin/fitsverify"
}
