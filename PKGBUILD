# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-perl-critic'
pkgver='1.03'
pkgrel='1'
pkgdesc="Use Perl::Critic in test programs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mce>=1.52' 'perl-critic>=1.105')
makedepends=()
url='https://metacpan.org/release/Test-Perl-Critic'
source=('http://search.cpan.org/CPAN/authors/id/T/TH/THALJEF/Test-Perl-Critic-1.03.tar.gz')
md5sums=('b10da607ed6c6c07eba99e48ce77d88a')
sha512sums=('2b6b9e7a73d00c99584853fdc5aef74dea5a581bb4bbe103eb65b086de659cb3328b0e58ec6e64413b76fa37a834083ff0c87cdc02413576f910904e0efd7b30')
_distdir="Test-Perl-Critic-1.03"

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
