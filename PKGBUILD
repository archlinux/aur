# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cpan-inject'
pkgver='1.14'
pkgrel='1'
pkgdesc="Base class for injecting distributions into CPAN sources"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-cpan-checksums>=1.05' 'perl-file-chmod>=0.30' 'perl-params-util>=0.21')
makedepends=('perl-file-remove>=0.34' 'perl-test-script>=1.02')
url='http://search.cpan.org/dist/CPAN-Inject'
source=('http://search.cpan.org/CPAN/authors/id/P/PS/PSHANGOV/CPAN-Inject-1.14.tar.gz')
md5sums=('f7118feb75f94d551edb9270f02e383b')
sha512sums=('32c69f3e7235b8491b14589089e1b687fb91cc0a15722dc682d2e08fe4ceb9b0587fc2fe3b18cca57cd56a8764c813ab91e2efe38f622177a8ee2355e71f84a2')
_distdir="CPAN-Inject-1.14"

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
