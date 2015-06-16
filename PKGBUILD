# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-forks'
pkgver='0.36'
pkgrel='1'
pkgdesc="drop-in replacement for Perl threads using fork()"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-acme-damn' 'perl-devel-symdump' 'perl-list-moreutils>=0.15' 'perl-sys-sigaction>=0.11')
makedepends=()
url='http://search.mcpan.org/dist/forks'
source=('http://search.mcpan.org/CPAN/authors/id/R/RY/RYBSKEJ/forks-0.36.tar.gz')
md5sums=('48a1819dd2ff67d756f268771e1a9827')
sha512sums=('d361d7fcfec925b03552bb5f8ae4eb2155b7945d0a57ff04c9ed45e7620a55fe6a1907b1aef8af3f80f8eabc158ab5886628ee1a987dc674e4c25e1042425469')
_distdir="forks-0.36"

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
