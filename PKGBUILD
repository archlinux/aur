# Maintainer: Guillaume Hayot <ghayot@postblue.info>

pkgname=libpurple-carbons
_pkgname=carbons
pkgver=0.1.5
pkgrel=1
pkgdesc='Experimental XEP-0280: Message Carbons plugin for libpurple (Pidgin, Finch, etc.)'
arch=('i686' 'x86_64')
url='https://github.com/gkdr/carbons'
license=('GPL')
depends=('libpurple' 'libxml2' 'glib2')
conflicts=('libpurple-carbons-git')
source=("$_pkgname-$pkgver.zip::https://github.com/gkdr/carbons/archive/v$pkgver.zip")
sha512sums=('0e050d87e859bb2e180a91c91e747af85ce6ecb11a62d274c05fc26b3340bec7f5ffbfff7bbf5381e599eae8cd37716b3447b5cc91bb096e277abfe33a654125')

build() {
    cd $srcdir/$_pkgname-$pkgver
    make
}

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver/build/$_pkgname.so" "$pkgdir/usr/lib/purple-2/$_pkgname.so"
}
