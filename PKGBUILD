# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-lwp-protocol-psgi'
pkgver='0.07'
pkgrel='1'
pkgdesc="Override LWP's HTTP/HTTPS backend with your own PSGI application"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-guard' 'perl-plack' 'perl-libwww' 'perl')
makedepends=()
checkdepends=('perl-test-requires')
url='https://metacpan.org/release/LWP-Protocol-PSGI'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/LWP-Protocol-PSGI-0.07.tar.gz')
md5sums=('06349aa3bb408153eb9644c62862e6a3')
sha512sums=('65a8faed0ad5f2a104931e4bcaa7d1f4065fd548248b4bcff417ad974e39ec1daaa8e6a55f3e4a09999a3c8d72561ed4dd2b179190675bc454ea86c73689d77c')
_distdir="LWP-Protocol-PSGI-0.07"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
