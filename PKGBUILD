# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-captcha-recaptcha'
pkgver='0.97'
pkgrel='1'
pkgdesc="A Perl implementation of the reCAPTCHA API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-tiny>=0.904' 'perl-libwww')
makedepends=()
url='http://search.cpan.org/dist/Captcha-reCAPTCHA'
source=('http://search.cpan.org/CPAN/authors/id/P/PH/PHRED/Captcha-reCAPTCHA-0.97.tar.gz')
md5sums=('0e8d3edfc5b580d99fca2bffeb7ef948')
sha512sums=('f16be381a858b9cb94a0c8a8bd1eb2aea383818ad8f1d9854f978e70ecee8f72de92ce948c486bdde4ffc06fb912720851ea67c3dc056dcc20f619be185ccb0e')
_distdir="Captcha-reCAPTCHA-0.97"

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
