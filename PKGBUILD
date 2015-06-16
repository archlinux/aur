# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-net-twitter'
pkgver='4.01004'
pkgrel='1'
pkgdesc="A perl interface to the Twitter API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-clan' 'perl-class-load' 'perl-data-visitor' 'perl-datetime' 'perl-datetime-format-strptime' 'perl-devel-stacktrace' 'perl-html-parser' 'perl-http-message' 'perl-json' 'perl-lwp-protocol-https' 'perl-moose' 'perl-moosex-role-parameterized' 'perl-net-http' 'perl-net-oauth' 'perl-try-tiny' 'perl-uri' 'perl-namespace-autoclean' 'perl>=5.8.1')
makedepends=('perl-libwww')
checkdepends=('perl-test-fatal' 'perl-test-warn')
conflicts=('perl-net-http=6.04' 'perl-net-http=6.05')
url='http://search.mcpan.org/dist/Net-Twitter'
source=('http://search.mcpan.org/CPAN/authors/id/M/MM/MMIMS/Net-Twitter-4.01004.tar.gz')
md5sums=('2ae7b1823843e889913cf4043f190d02')
sha512sums=('6b7dcd80faa8c80eca0149ef9007a8669e9f3e37533198a4f32d4104eb330c58dfdb8af91e1e2b668f536d89c557378794a41392f2843c2e11c525098b78d96d')
_distdir="Net-Twitter-4.01004"

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
