# PKGBUILD for mess822
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
pkgname=mess822
pkgver=0.58
pkgrel=1
epoch=
pkgdesc="mess822 is a library for parsing Internet mail messages works wellwith qmail"
arch=('i686', 'x86_64')
url="http://cr.yp.to/mess822.html"
license=('unknown')
groups=()
depends=()
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
        mess822-conf-cc.patch)
noextract=()
md5sums=('8ce4c29c994a70dcaa30140601213dbe'
         '240fb4d711016ee9a4637fe6619d14dc')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/mess822-conf-cc.patch"
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
  #make DESTDIR="$pkgdir/" install

  mkdir "$pkgdir/usr"
  chmod 755 "$pkgdir/usr"

  mkdir "$pkgdir/usr/lib"
  chmod 755 "$pkgdir/usr/lib"
  for f in mess822.a
  do
    cp "$f" "$pkgdir/usr/lib/$f"
    chmod 644 "$pkgdir/usr/lib/$f"
  done

  mkdir "$pkgdir/usr/include"
  chmod 755 "$pkgdir/usr/include"
  for f in mess822.h
  do
    cp "$f" "$pkgdir/usr/include/$f"
    chmod 644 "$pkgdir/usr/include/$f"
  done

  mkdir "$pkgdir/usr/bin"
  chmod 755 "$pkgdir/usr/bin"
  for f in ofmipd ofmipname iftocc new-inject 822field 822header 822date 822received 822print
  do
    cp "$f" "$pkgdir/usr/bin/$f"
    chmod 644 "$pkgdir/usr/bin/$f"
  done

  mkdir "$pkgdir/usr/man"
  chmod 755 "$pkgdir/usr/man"

  mkdir "$pkgdir/usr/man/man1"
  chmod 755 "$pkgdir/usr/man/man1"
  for f in iftocc.1 new-inject.1 822field.1 822header.1 822date.1 822received.1 822print.1
  do
    cp "$f" "$pkgdir/usr/man/man1/$f"
    chmod 644 "$pkgdir/usr/man/man1/$f"
  done

  mkdir "$pkgdir/usr/man/man5"
  chmod 755 "$pkgdir/usr/man/man5"
  for f in rewriting.5
  do
    cp "$f" "$pkgdir/usr/man/man5/$f"
    chmod 644 "$pkgdir/usr/man/man5/$f"
  done

  mkdir "$pkgdir/usr/man/man8"
  chmod 755 "$pkgdir/usr/man/man8"
  for f in ofmipd.8 ofmipname.8
  do
    cp "$f" "$pkgdir/usr/man/man8/$f"
    chmod 644 "$pkgdir/usr/man/man8/$f"
  done

  mkdir "$pkgdir/usr/man/man3"
  chmod 755 "$pkgdir/usr/man/man3"
  for f in mess822.3 mess822_addr.3 mess822_date.3 mess822_fold.3 mess822_quote.3 mess822_token.3 mess822_when.3
  do
    cp "$f" "$pkgdir/usr/man/man3/$f"
    chmod 644 "$pkgdir/usr/man/man3/$f"
  done

  mkdir "$pkgdir/usr/man/cat1"
  chmod 755 "$pkgdir/usr/man/cat1"
  for f in iftocc.0 new-inject.0 822field.0 822header.0 822date.0 822received.0 822print.0
  do
    cp "$f" "$pkgdir/usr/man/cat1/$f"
    chmod 644 "$pkgdir/usr/man/cat1/$f"
  done

  mkdir "$pkgdir/usr/man/cat5"
  chmod 755 "$pkgdir/usr/man/cat5"
  for f in rewriting.0
  do
    cp "$f" "$pkgdir/usr/man/cat5/$f"
    chmod 644 "$pkgdir/usr/man/cat5/$f"
  done

  mkdir "$pkgdir/usr/man/cat8"
  chmod 755 "$pkgdir/usr/man/cat8"
  for f in ofmipd.0 ofmipname.0;
  do
    cp "$f" "$pkgdir/usr/man/cat8/$f"
    chmod 644 "$pkgdir/usr/man/cat8/$f"
  done

  mkdir "$pkgdir/usr/man/cat3"
  chmod 755 "$pkgdir/usr/man/cat3"
  for f in mess822.0 mess822_addr.0 mess822_date.0 mess822_fold.0 mess822_quote.0 mess822_token.0 mess822_when.0;
  do
    cp "$f" "$pkgdir/usr/man/cat3/$f"
    chmod 644 "$pkgdir/usr/man/cat3/$f"
  done

  mkdir "$pkgdir/etc"
  chmod 755 "$pkgdir/etc"
  for f in leapsecs.dat;
  do
    cp "$f" "$pkgdir/etc/$f"
    chmod 644 "$pkgdir/etc/$f"
  done

}

# EOF
