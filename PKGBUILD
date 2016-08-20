# Contributor: Krash <8552246@gmail.com>\
# Maintainer: izmntuk
pkgname=debmirror
pkgver=2.25
pkgrel=1
pkgdesc="Debian partial mirror script, with ftp and package pool support"
url="https://anonscm.debian.org/cgit/collab-maint/debmirror.git/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bzip2' 'perl-compress-zlib' 'perl-digest-sha1' 'perl-lockfile-simple' 'perl-libwww' 'rsync' 'perl-net-inet6glue' 'gnupg')
source=("https://mirrors.kernel.org/debian/pool/main/d/debmirror/debmirror_$pkgver.tar.xz")

build() {
  cd "$srcdir/$pkgname"

  make all
}

check() {
  cd "$srcdir/$pkgname"

  make check
}

package() {
  cd "$srcdir/$pkgname"

  install -Dpm644 examples/debmirror.conf $pkgdir/usr/share/doc/debmirror/examples/debmirror.conf
  install -Dpm755 debmirror   $pkgdir/usr/bin/debmirror
  install -Dpm755 mirror-size $pkgdir/usr/lib/debmirror/mirror-size
  install -Dpm644 debmirror.1 $pkgdir/usr/share/man/man1/debmirror.1
  install -Dpm644 doc/design.txt $pkgdir/usr/share/doc/debmirror/design.txt
  install -Dpm644 TODO $pkgdir/usr/share/doc/$pkgname/TODO
}

sha512sums=('3523558b0051ea0102c3481d5be63c1cd2b15a2e0bfbd958950bf864b2fc640ca180adc859ce23c59031691ffb0bb703b0c8325fb86e07c6b372a45babbd8cc0')
