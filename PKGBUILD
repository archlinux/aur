# Maintainer: Guillaume Hayot <ghayot@postblue.info>

pkgname=libpurple-carbons
_pkgname=carbons
pkgver=0.2.2
pkgrel=1
pkgdesc='Experimental XEP-0280: Message Carbons plugin for libpurple (Pidgin, Finch, etc.)'
arch=('i686' 'x86_64')
url='https://github.com/gkdr/carbons'
license=('GPL')
depends=('libpurple' 'libxml2' 'glib2')
conflicts=('libpurple-carbons-git')
source=("$_pkgname-$pkgver.zip::https://github.com/gkdr/carbons/archive/v$pkgver.zip")
sha512sums=('940213f0e5847a9236db80a6e0640176759904f6c50143ccfc744a6020cf006ed00f09c45faca2555871055325515417b6b3872d176279481b942e62eab56681')

build() {
    cd $srcdir/$_pkgname-$pkgver
    make
}

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver/build/$_pkgname.so" "$pkgdir/usr/lib/purple-2/$_pkgname.so"
}
