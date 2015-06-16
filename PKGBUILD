# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-engine-psgi'
pkgver='0.13'
pkgrel='1'
pkgdesc="PSGI engine for Catalyst"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-catalyst-action-renderview' 'perl-catalyst-runtime>=5.80007')
makedepends=('perl-test-requires' 'perl-test-tcp')
url='http://search.cpan.org/dist/Catalyst-Engine-PSGI'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Catalyst-Engine-PSGI-0.13.tar.gz')
md5sums=('4b48a53b1ecf5c236488de57c773e9f0')
sha512sums=('4447545400fc28c2eeb23230aec875a12b6837a03baa4c9e47da84f9b245ae06045423d8f14f28f9c2d11d6542f45c714a99301f0fd1301caa0950eaa7364b14')
_distdir="Catalyst-Engine-PSGI-0.13"

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
