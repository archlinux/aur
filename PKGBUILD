# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-log-any-adapter-callback'
pkgver='0.09'
pkgrel='1'
pkgdesc="Send Log::Any logs to a subroutine"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-log-any')
makedepends=()
url='https://metacpan.org/release/Log-Any-Adapter-Callback'
source=('http://search.cpan.org/CPAN/authors/id/S/SH/SHARYANTO/Log-Any-Adapter-Callback-0.09.tar.gz')
md5sums=('0c805bfdda80fd0157a02f32a76dd158')
sha512sums=('4a311d68c5b211071e2b3549db846d1f5c3cfe7d933b805a843bfa241751015823a2376ce324386f625349416ea79cca3f91e07f514ae6e15792df50c31f0c68')
_distdir="Log-Any-Adapter-Callback-0.09"

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
