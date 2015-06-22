# PKGBUILD for fastforward
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
pkgname=fastforward
pkgver=0.51
pkgrel=1
epoch=
pkgdesc="fastforward handles qmail forwarding according to a cdb database"
arch=('i686', 'x86_64')
url="http://cr.yp.to/fastforward.html"
license=('unknown')
groups=()
depends=('glibc' 'qmail')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://cr.yp.to/software/$pkgname-$pkgver.tar.gz
        fastforward-cc-conf.patch)
noextract=()
md5sums=('6dc619180ba9726380dc1047e45a1d8d'
         '7c6ebb4e2e514bebc11296f0a2ee80eb')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/fastforward-cc-conf.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make default
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  #make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  #make DESTDIR="$pkgdir/" setup
  mkdir -p $pkgdir/var/qmail
  chmod 0755 $pkgdir/var/qmail
  mkdir $pkgdir/var/qmail/bin
  chmod 0755 $pkgdir/var/qmail/bin
  mkdir $pkgdir/var/qmail/man
  chmod 0755 $pkgdir/var/qmail/man
  mkdir $pkgdir/var/qmail/man/man1
  chmod 0755 $pkgdir/var/qmail/man/man1
  mkdir $pkgdir/var/qmail/man/cat1
  chmod 0755 $pkgdir/var/qmail/man/cat1
  mkdir $pkgdir/var/qmail/doc
  chmod 0755 $pkgdir/var/qmail/doc
  mkdir $pkgdir/var/qmail/doc/fastforward
  chmod 755 $pkgdir/var/qmail/doc/fastforward

  cp fastforward $pkgdir/var/qmail/bin/fastforward
  chmod 755 $pkgdir/var/qmail/bin/fastforward

  cp printforward $pkgdir/var/qmail/bin/printforward
  chmod 755 $pkgdir/var/qmail/bin/printforward

  cp setforward $pkgdir/var/qmail/bin/setforward
  chmod 755 $pkgdir/var/qmail/bin/setforward

  cp newaliases $pkgdir/var/qmail/bin/newaliases
  chmod 755 $pkgdir/var/qmail/bin/newaliases

  cp printmaillist $pkgdir/var/qmail/bin/printmaillist
  chmod 755 $pkgdir/var/qmail/bin/printmaillist

  cp setmaillist $pkgdir/var/qmail/bin/setmaillist
  chmod 755 $pkgdir/var/qmail/bin/setmaillist

  cp newinclude $pkgdir/var/qmail/bin/newinclude
  chmod 755 $pkgdir/var/qmail/bin/newinclude

  cp ALIASES $pkgdir/var/qmail/doc/fastforward/ALIASES
  chmod 755 $pkgdir/var/qmail/doc/fastforward/ALIASES

  cp fastforward.1 $pkgdir/var/qmail/man/man1/fastforward.1
  chmod 644 $pkgdir/var/qmail/man/man1/fastforward.1
  cp fastforward.0 $pkgdir/var/qmail/man/cat1/fastforward.1
  chmod 644 $pkgdir/var/qmail/man/cat1/fastforward.1

  cp printforward.1 $pkgdir/var/qmail/man/man1/printforward.1
  chmod 644 $pkgdir/var/qmail/man/man1/printforward.1
  cp printforward.0 $pkgdir/var/qmail/man/cat1/printforward.1
  chmod 644 $pkgdir/var/qmail/man/cat1/printforward.1

  cp setforward.1 $pkgdir/var/qmail/man/man1/setforward.1
  chmod 644 $pkgdir/var/qmail/man/man1/setforward.1
  cp setforward.0 $pkgdir/var/qmail/man/cat1/setforward.1
  chmod 644 $pkgdir/var/qmail/man/cat1/setforward.1

  cp newaliases.1 $pkgdir/var/qmail/man/man1/newaliases.1
  chmod 644 $pkgdir/var/qmail/man/man1/newaliases.1
  cp newaliases.0 $pkgdir/var/qmail/man/cat1/newaliases.1
  chmod 644 $pkgdir/var/qmail/man/cat1/newaliases.1

  cp printmaillist.1 $pkgdir/var/qmail/man/man1/printmaillist.1
  chmod 644 $pkgdir/var/qmail/man/man1/printmaillist.1
  cp printmaillist.0 $pkgdir/var/qmail/man/cat1/printmaillist.1
  chmod 644 $pkgdir/var/qmail/man/cat1/printmaillist.1

  cp setmaillist.1 $pkgdir/var/qmail/man/man1/setmaillist.1
  chmod 644 $pkgdir/var/qmail/man/man1/setmaillist.1
  cp setmaillist.0 $pkgdir/var/qmail/man/cat1/setmaillist.1
  chmod 644 $pkgdir/var/qmail/man/cat1/setmaillist.1

  cp newinclude.1 $pkgdir/var/qmail/man/man1/newinclude.1
  chmod 644 $pkgdir/var/qmail/man/man1/newinclude.1
  cp newinclude.0 $pkgdir/var/qmail/man/cat1/newinclude.1
  chmod 644 $pkgdir/var/qmail/man/cat1/newinclude.1

}
# EOF
