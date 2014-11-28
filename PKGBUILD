# Contributor: Dragonlord <archlinux[at]dragonlord[.]cz>

pkgname=dlume
pkgver=0.2.4
pkgrel=4
pkgdesc="A handy and easy to use addressbook."
arch=('i686' 'x86_64')
url="http://directory.fsf.org/project/dlume/"
license=('GPL')
depends=('gtk2' 'libxml2' 'desktop-file-utils')
install=$pkgname.install
source=(http://cvsup.theplanet.com/distfiles/$pkgname-$pkgver.tar.gz \
        $pkgname.desktop)

md5sums=('6b2a3ef0eff622a412395187d1c5d178'
         '89d386aa13fe8633379d90c9bb67f523')

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man

  make || return 1
  make DESTDIR="$startdir/pkg" install

  install -D -m644 "$startdir/$pkgname.desktop" \
    "$startdir/pkg/usr/share/applications/$pkgname.desktop" || return 1
}
