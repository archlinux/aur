# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-data-dumper-concise'
pkgver='2.022'
pkgrel='1'
pkgdesc="Less indentation and newlines plus sub deparsing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Data-Dumper-Concise'
source=('http://search.mcpan.org/CPAN/authors/id/F/FR/FREW/Data-Dumper-Concise-2.022.tar.gz')
md5sums=('416882cd86114e7cea9a429ae97fb5a6')
sha512sums=('a3b17d740571db3d1968438830af5aee912f671dbc3692b2708ecb9301bc7770025d48202c3414a8e50cc2b48050f8b27b2a2c9b62d01681f0ce06888c37bd40')
_distdir="Data-Dumper-Concise-2.022"

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
