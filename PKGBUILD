# Maintainer: Guillaume Hayot <ghayot@postblue.info>
# Thanks to: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=libpurple-carbons
_pkgname=carbons
pkgver=0.1.4
pkgrel=1
pkgdesc='Experimental XEP-0280: Message Carbons plugin for libpurple (Pidgin, Finch, etc.)'
arch=('i686' 'x86_64')
url='https://github.com/gkdr/carbons'
license=('GPL')
makedepends=('git')
depends=('libpurple' 'libxml2' 'glib2')
conflicts=('libpurple-carbons-git')
source=("$_pkgname-$pkgver.zip::https://github.com/gkdr/carbons/archive/v$pkgver.zip")
sha512sums=('6767103703502dd7d7c63d1726d5ebc238105bebfe6661c82206da5fc7c8671a9c8f7a9763ec801b0bcc81a7e586ce188e7ca82c94e6f5c9b49c1819a73ceb06')

build() {
    cd $srcdir/$_pkgname-$pkgver
    make
}

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver/build/$_pkgname.so" "$pkgdir/usr/lib/purple-2/$_pkgname.so"
}
