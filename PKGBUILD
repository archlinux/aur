# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-filehandle-unget'
pkgver='0.1623'
pkgrel='1'
pkgdesc="FileHandle which supports multi-byte unget"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/FileHandle-Unget'
source=('http://search.cpan.org/CPAN/authors/id/D/DC/DCOPPIT/FileHandle-Unget-0.1623.tar.gz')
md5sums=('27df2a78e60e30b1950bbf41740eae13')
sha512sums=('fa1554226a6fac5cba8d4f1b359d820990550700328907b8f606e69e9eed99d04e6899fc2048befb168227e374c3a4690180691b96e5beab36ee3dfa249480ae')
_distdir="FileHandle-Unget-0.1623"

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
