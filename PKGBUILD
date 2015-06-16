# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-plack-middleware-serverstatus-lite'
pkgver='0.18'
pkgrel='1'
pkgdesc="show server status like Apache's mod_status"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json>=2.53' 'perl-libwww' 'perl-net-cidr-lite' 'perl-parallel-scoreboard>=0.03' 'perl-plack' 'perl-starman>=0.3013' 'perl-try-tiny>=0.09')
makedepends=('perl-test-tcp>=2.00')
url='http://search.cpan.org/dist/Plack-Middleware-ServerStatus-Lite'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/Plack-Middleware-ServerStatus-Lite-0.18.tar.gz')
md5sums=('45e1ddc9c1fde9fa4be751841ea80d33')
sha512sums=('5a3867bf2d750d28f0422fb26dee925a3b131c783c7622bdce52223e60863bd14ccb1e29f0963dbe17b9dadabf6c397a9b8d7719324c320839911ce49150fe65')
_distdir="Plack-Middleware-ServerStatus-Lite-0.18"

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
