# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojox-log-log4perl'
pkgver='0.12'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-log-log4perl>=1.25' 'perl-mojolicious>=2' 'perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/MojoX-Log-Log4perl'
source=("http://search.cpan.org/CPAN/authors/id/G/GA/GARU/MojoX-Log-Log4perl-${pkgver}.tar.gz")
md5sums=('9ebfb2f6f4352986ffd38d772c3e2e9b')
sha512sums=('3ea4009fa72060460ea8730071395bf1a3f160ac6ab55ef4c62f26f5766dad7995dc247281ff8506ffb4178b2c33a768ae8ea32e38cade17b904b6c73c2b1009')
_distdir="MojoX-Log-Log4perl-${pkgver}"

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
