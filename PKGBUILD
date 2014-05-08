# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Jaroslav Lichtblau <tu@dragonlord.cz>

pkgname=gxmessage-gtk2
_pkgname=gxmessage
pkgver=2.20.1
pkgrel=1
pkgdesc="A GTK2 based xmessage clone for GTK2."
arch=('i686' 'x86_64')
url="http://homepages.ihug.co.nz/~trmusson/programs.html#gxmessage"
license=('GPL')
depends=('gtk2' 'desktop-file-utils')
makedepends=('pkgconfig' 'intltool')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$_pkgname.install
source=(http://homepages.ihug.co.nz/~trmusson/stuff/$_pkgname-$pkgver.tar.gz
        $_pkgname.desktop)
md5sums=('f4160442548bdd90895b008b85df0f6e'
         'af92506581c1aae70e3845a66a983f22')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir/$_pkgname.desktop" \
    "${pkgdir}/usr/share/applications/$_pkgname.desktop"
}
md5sums=('45428121eb08db8472fc378dc93d171d'
         'af92506581c1aae70e3845a66a983f22')
