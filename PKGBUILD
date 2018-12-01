# Maintainer: Ainola
# Contributor: Justin Dray
# Contributor: Andy Kluger
# Contributor: Alexander 'hatred' Drozdov
# Contributor: G_Syme
# Contributor: SpepS
# Contributor: Bastien Dejean

pkgname=libicns
pkgver=0.8.1
pkgrel=5
pkgdesc='Library for manipulating icns/IconFamily files'
arch=('x86_64')
url='https://icns.sourceforge.io/'
license=('LGPL' 'GPL2')
depends=('libpng' 'jasper')
source=("https://downloads.sf.net/icns/$pkgname-$pkgver.tar.gz")
sha256sums=('335f10782fc79855cf02beac4926c4bf9f800a742445afbbf7729dab384555c2')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
