# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-plack-session-store-redis'
pkgver='0.05'
pkgrel='1'
pkgdesc="Redis based session store for Plack apps."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json' 'perl-plack' 'perl-plack-middleware-session' 'perl-redis')
makedepends=()
checkdepends=('perl-test-exception')
url='https://metacpan.org/release/Plack-Session-Store-Redis'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEEDO/Plack-Session-Store-Redis-0.05.tar.gz')
md5sums=('6fcde8cfe6576d146559ca934b2d68cc')
sha512sums=('c694e53b727ef44776ad788881345d6bd859884b5ccb1bdb5ecb5e21a807c540e7f6b2a98dba6b06bcf950e55dc13034af217853ca382866cfb2e9ede2964abc')
_distdir="Plack-Session-Store-Redis-0.05"

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
