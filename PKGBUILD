# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-search-xapian'
pkgver='1.2.24.0'
pkgrel='1'
pkgdesc="Perl XS frontend to the Xapian C++ search library."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.0' 'perl-devel-leak' 'xapian-core>=1:1.4.2')
makedepends=()
url='https://metacpan.org/release/Search-Xapian'
source=('http://search.cpan.org/CPAN/authors/id/O/OL/OLLY/Search-Xapian-1.2.24.0.tar.gz')
md5sums=('01206bf2cc71c5b3a6258a01daabfc43')
sha512sums=('48fed912c1d20933e45ab75c064b33996642d43c157a3ec90a50f3e57070d48d655dc7816237e0da9b2df7a2aeddc14c5532bbf3a1ce4cd10d83cc7e0a74b2dd')
_distdir="Search-Xapian-1.2.24.0"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
