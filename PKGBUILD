# Maintainer: Aleksandr Boiko <4le34n at gmail dot com>
pkgname=sc-tool
_pkgname=sc
pkgver=1.5.7
pkgrel=3
epoch=
pkgdesc="Administration tool for Linux-based ISP traffic shaper"
arch=('any')
url="https://sourceforge.net/projects/sc-tool/files/sc-tool"
license=('GPL')
depends=('perl')
install=
source=("$url/$_pkgname-$pkgver.tar.bz2"
        'Makefile.patch')
md5sums=('ac9fa4dd38d2893d7eea91368448e7c9'
         '853cc12517dca9610fb843c652f613de')

prepare() {
    cd "$_pkgname-$pkgver"
    msg2 "Patching Makefile ..."
    patch -p0 -i ../Makefile.patch
}

build() {
	cd "$_pkgname-$pkgver"
    make
}

package() {
	cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm0644 README "$pkgdir/usr/share/doc/$pkgname/README" 
}

