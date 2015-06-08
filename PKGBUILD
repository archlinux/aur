# Maintainer: Volker Schatz <arch@my-name-without-hyphen.com>
# Contributor: Brandon Andrews <bsa@bsa.isa-geek.com>
# Contributor: Bin Jin <bjin1990 at gmail dot com>

pkgname=pfscalibration
pkgver=1.6
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Photometric calibration and recovery of high dynamic range (HDR) images from multiple exposures"
url="http://pfstools.sourceforge.net/pfscalibration.html"
license="GPL LGPL FDL"
depends=('pfstools' 'jhead')
provides=('pfscalibration')
source=("http://downloads.sourceforge.net/pfstools/$pkgname-$pkgver.tar.gz")
md5sums=('901b8a58438ec7006e21ee1ee310f158')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make prefix="$pkgdir/usr" install
}

