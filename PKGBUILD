# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-anymq'
pkgver='0.35'
pkgrel='1'
pkgdesc="Non-blocking message queue system based on AnyEvent"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-any-moose' 'perl-anyevent' 'perl-moosex-traits' 'perl-mousex-nativetraits' 'perl-mousex-traits' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/AnyMQ'
source=('http://search.cpan.org/CPAN/authors/id/C/CL/CLKAO/AnyMQ-0.35.tar.gz')
md5sums=('7e3662f0a5992820d5868ad3274c2bb0')
sha512sums=('1007324d60c17e8c16fdfb0c45a6203ded08f1a24428998a4257cc5c9fa202c83aeb827d79dbd5f2e71c7dc027d3030310b236feeb6b5f4cbb0de66e3fd3d738')
_distdir="AnyMQ-0.35"

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
    make test || return 0
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
