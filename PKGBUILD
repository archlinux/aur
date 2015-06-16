# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-dbi-plugin-deepabstractsearch'
pkgver='0.08'
pkgrel='1'
pkgdesc="deep_search_where() for Class::DBI"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-dbi>=0.96' 'perl-class-dbi-plugin>=0.02' 'perl-sql-abstract>=1.18')
makedepends=()
url='http://search.cpan.org/dist/Class-DBI-Plugin-DeepAbstractSearch'
source=('http://search.cpan.org/CPAN/authors/id/S/SR/SRIHA/Class-DBI-Plugin-DeepAbstractSearch-0.08.tar.gz')
md5sums=('c4753aff910ba9080dfa4040ed834d4e')
sha512sums=('75ff99c88e9fd0a26c3bcbf91d89d023b11edaa3a184dd50b50ebc5e547e36f82bc90bd43ab27649a29a573443bc1fa3ff46ca364301f191fe60df8bd3a5ec2a')
_distdir="Class-DBI-Plugin-DeepAbstractSearch-0.08"

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
