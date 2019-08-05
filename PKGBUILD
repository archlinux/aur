# Maintainer: Graham Bell <graham dot s dot bell at gmail dot com>
pkgname=fitsverify
pkgver=4.20
pkgrel=1
pkgdesc="A FITS file format-verification tool"
arch=('i686' 'x86_64')
url="https://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/"
license=('unknown')
depends=('cfitsio')
source=("https://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/$pkgname-$pkgver.tar.gz")
md5sums=('472f6189ce1acaf90a3e3308ebf3befd')

build() {
	cd "$srcdir/$pkgname-$pkgver"
        gcc -o fitsverify \
                ftverify.c fvrf_data.c fvrf_file.c fvrf_head.c \
                fvrf_key.c fvrf_misc.c \
                -DSTANDALONE \
                -lcfitsio
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        install -D fitsverify "$pkgdir/usr/bin/fitsverify"
}
