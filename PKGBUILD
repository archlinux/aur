# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-dbi-plugin-fastdelete'
pkgver='0.01'
pkgrel='1'
pkgdesc="Add to Class::DBI for more fast delete method."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-dbi' 'perl-sql-abstract')
makedepends=()
url='http://search.cpan.org/dist/Class-DBI-Plugin-FastDelete'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEKOKAK/Class-DBI-Plugin-FastDelete-0.01.tar.gz')
md5sums=('85a508db42adc3e9dc6e59f5019a9f4d')
sha512sums=('dd520b18d7b262726cae85bd09946f977bd4ba335f409e8c581220ac617843b2f7fe5c674e7871b4925015b6578b6aef5fa20c45abdd0509bcb5e20cfcb3c058')
_distdir="Class-DBI-Plugin-FastDelete-0.01"

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
