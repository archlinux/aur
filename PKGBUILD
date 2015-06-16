# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-dbicx-testdatabase'
pkgver='0.05'
pkgrel='1'
pkgdesc="create a temporary database from a DBIx::Class::Schema"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbd-sqlite>=1.29' 'perl-sql-translator>=0')
makedepends=('perl-dbix-class>=0' 'perl-test-use-ok>=0')
url='http://search.cpan.org/dist/DBICx-TestDatabase'
source=('http://search.cpan.org/CPAN/authors/id/J/JR/JROCKWAY/DBICx-TestDatabase-0.05.tar.gz')
md5sums=('a022f7e4ae5dfebcb246a7903ad0aa6a')
sha512sums=('df17c75594998e4a17b284d5c20809019f31e5ab20dd354e2d7e159d1d76554e3c08bd1797277b9909efe8ecd10aa82b606b325e1759258521c7e3cd5995c2c1')
_distdir="DBICx-TestDatabase-0.05"

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
