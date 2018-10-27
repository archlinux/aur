# Maintainer: Guillaume Hayot <ghayot@postblue.info>

pkgname=libpurple-carbons
_pkgname=carbons
pkgver=0.2.1
pkgrel=1
pkgdesc='Experimental XEP-0280: Message Carbons plugin for libpurple (Pidgin, Finch, etc.)'
arch=('i686' 'x86_64')
url='https://github.com/gkdr/carbons'
license=('GPL')
depends=('libpurple' 'libxml2' 'glib2')
conflicts=('libpurple-carbons-git')
source=("$_pkgname-$pkgver.zip::https://github.com/gkdr/carbons/archive/v$pkgver.zip")
sha512sums=('7c5f6a8182a548a6c790ba5031101701f6d6f68800a44f13e22d912995e1ba3e7f9265f7b5aa7d0074d498ca7690b3b87811e12c960e51b0df3a76ea18064673')

build() {
    cd $srcdir/$_pkgname-$pkgver
    make
}

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver/build/$_pkgname.so" "$pkgdir/usr/lib/purple-2/$_pkgname.so"
}
