# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sms-send'
pkgver='1.07'
pkgrel='1'
pkgdesc="Perl/CPAN Module SMS::Send: Driver-based API for sending SMS messages"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.0' 'perl-class-adapter>=1.05' 'perl-module-pluggable>=3.7' 'perl-params-util>=1.00')
makedepends=()
url='https://metacpan.org/release/SMS-Send'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/SMS-Send-$pkgver.tar.g")
md5sums=('71989af7a2c95a328b7e4abafa3f12e1')
sha512sums=('e925de53c9fb45caf350322a64caabd63568cedae4e22141ceadc33392469cd88cdf2606c929a3a022f45956f5943d8126749c8063f5249f6c51a2f1fa118b01')
_distdir="SMS-Send-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
