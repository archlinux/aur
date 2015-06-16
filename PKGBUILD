# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-text-format'
pkgver='0.59'
pkgrel='1'
pkgdesc="Various subroutines to format text."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-module-build')
url='https://metacpan.org/release/Text-Format'
source=('http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Text-Format-0.59.tar.gz')
md5sums=('ab4ae26dbbb7eed101dc7a4324ac9c10')
sha512sums=('030fc38853f96d64f359af1ad9f776e7c797f564f11207de32477b3b716da665dbce3b91d988241ba1fbd2b884aa85b0ce0b7b473aaf0efd23839f8422a52fcd')
_distdir="Text-Format-0.59"

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
