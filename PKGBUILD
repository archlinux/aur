# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-leocharre-cli2'
pkgver='1.16'
pkgrel='1'
pkgdesc="Some quick help for writing cli scripts."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-symdump>=2.07' 'perl-getopt-std-strict>=1.01' 'perl-leocharre-dir>=1.06' 'perl-smart-comments' 'perl-string-shellquote>=1.03' 'perl-yaml')
makedepends=()
url='https://metacpan.org/release/LEOCHARRE-CLI2'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEOCHARRE/LEOCHARRE-CLI2-1.16.tar.gz')
md5sums=('bfe7a60a89d7485984a24f5c91637598')
sha512sums=('9fd5c4741057ef367c3bc84d6cdd712da8bf4eb3a8598197643247d9fd197bbd35b9ace20ceccfffaa6694b5e650c2368200c3f0be34e997dca03a76d60002a4')
_distdir="LEOCHARRE-CLI2-1.16"

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
  #Tests broken for v1.16: https://rt.cpan.org/Ticket/Display.html?id=100192
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
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
