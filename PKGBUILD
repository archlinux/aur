# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-anyevent-termkey'
pkgver='0.02'
pkgrel='1'
pkgdesc="terminal key input using libtermkey with AnyEvent"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent' 'perl-term-termkey>=0.08')
makedepends=()
url='https://metacpan.org/release/AnyEvent-TermKey'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/AnyEvent-TermKey-0.02.tar.gz')
md5sums=('abe6ab1a778a265abec8967c4f5e108a')
sha512sums=('6de9a5c94a2f133840f02c27f00898c432e155628c420f1cae15e646eb1ab7d58eb8a8d43ddca9560d5d3a2a54138bdd90b332b10f009a92e9795bff891a58fa')
_distdir="AnyEvent-TermKey-0.02"

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
