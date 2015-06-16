# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-perl-critic'
pkgver='1.02'
pkgrel='1'
pkgdesc="Use Perl::Critic in test programs."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-critic>=1.082')
makedepends=()
url='http://search.cpan.org/dist/Test-Perl-Critic'
source=('http://search.cpan.org/CPAN/authors/id/T/TH/THALJEF/Test-Perl-Critic-1.02.tar.gz')
md5sums=('7f1e75cc3d933e4deab5097c5b8c812d')
sha512sums=('af18523fa6ad2ed35114bc5a466c8d92f27cfaca3a32c3fc6d24bdafd6f962187f0f18f5cae96949cb81a4c2f1cac280993c8b5236a8b02ccc130d01c8990348')
_distdir="Test-Perl-Critic-1.02"

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
