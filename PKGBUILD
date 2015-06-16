# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-log-dispatch-config'
pkgver='1.04'
pkgrel='1'
pkgdesc="Log4j for Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-appconfig>=1.52' 'perl-io-stringy' 'perl-log-dispatch>=2')
makedepends=()
url='http://search.cpan.org/dist/Log-Dispatch-Config'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Log-Dispatch-Config-1.04.tar.gz')
md5sums=('ac6f91b838743adb3a47cb09bf8defe5')
sha512sums=('827b767806b206f244955f8f57b7206f84aac75012ec6443fb0c427e0fb0e52cad112cc012bd5c43a1e4a82d9fd49adb7bd024130579754dbe0ad4a2218460ef')
_distdir="Log-Dispatch-Config-1.04"

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
