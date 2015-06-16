# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-script'
pkgver='1.07'
pkgrel='1'
pkgdesc="Basic cross-platform tests for scripts"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ipc-run3>=0.034' 'perl-probe-perl>=0.01')
makedepends=()
url='http://search.cpan.org/dist/Test-Script'
source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Test-Script-1.07.tar.gz')
md5sums=('f6b5baa6403cd24dac7f023e0ea22384')
sha512sums=('2cf7dc06977288910f157a5c0804d02e2a259c693adda59b80b89bba7eab22f74b317976a8a6f0fe6f28a87090dcc6f57c0245006b1eea600e2d71e6966ede97')
_distdir="Test-Script-1.07"

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
