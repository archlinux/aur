# Maintainer: awe00 < awe00 AT hotmail DOT fr>
pkgname=perl-data-treedumper-renderer-gtk
pkgver=0.02
pkgrel=1
pkgdesc='This Gtk2::TreeView derived widget allows you to diplay a Data::TreeDumper generated
dump in a GTK window. The nodes are collapsable.'
_dist=Data-TreeDumper-Renderer-GTK
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-treedumper gtk2-perl glib-perl perl-class-isa)
makedepends=()
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/N/NK/NKH/$_dist-$pkgver.tar.gz")
md5sums=("SKIP")

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
