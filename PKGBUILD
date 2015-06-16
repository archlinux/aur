# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-dbi-fromform'
pkgver='0.04'
pkgrel='1'
pkgdesc="Update Class::DBI data using Data::FormValidator or HTML Widget"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-dbi' 'perl-data-formvalidator')
makedepends=()
url='http://search.cpan.org/dist/Class-DBI-FromForm'
source=('http://search.cpan.org/CPAN/authors/id/M/MR/MRAMBERG/Class-DBI-FromForm-0.04.tar.gz')
md5sums=('e7650bc088c6bec6f7068b34484f1118')
sha512sums=('f2c1ac06e01200b2fc2c29794ec4e721a555016a559856973e1db3a11ae67ba42241746755fb5fd011c9c21e8e19d0b53eaa3ea1cb4cdc9f2a48c90ffa783013')
_distdir="Class-DBI-FromForm-0.04"

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
