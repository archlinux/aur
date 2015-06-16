# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-dbix-class-timestamp'
pkgver='0.14'
pkgrel='1'
pkgdesc="DBIx::Class extension to update and create date and time based fields"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-datetime>=0.55' 'perl-dbix-class>=0.08009' 'perl-dbix-class-dynamicdefault>=0.03')
makedepends=('perl-class-accessor-grouped' 'perl-datetime-format-mysql' 'perl-datetime-format-sqlite' 'perl-time-warp')
url='http://search.cpan.org/dist/DBIx-Class-TimeStamp'
source=('http://search.cpan.org/CPAN/authors/id/R/RI/RIBASUSHI/DBIx-Class-TimeStamp-0.14.tar.gz')
md5sums=('02526ab3bc2aac7845ac18909a97a37b')
sha512sums=('f4b47b1c9eb467fb3b50caa4a4c9733c9b49d90716edacbda061524b0ee23365f6f872248acfcfff595c7185c9dd9732d1c107eda08585c629b1aabb9af2e930')
_distdir="DBIx-Class-TimeStamp-0.14"

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
