# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-pbkdf2-tiny'
pkgver='0.005'
pkgrel='1'
pkgdesc="Minimalist PBKDF2 (RFC 2898) with HMAC-SHA1 or HMAC-SHA2"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/PBKDF2-Tiny'
source=('http://search.mcpan.org/CPAN/authors/id/D/DA/DAGOLDEN/PBKDF2-Tiny-0.005.tar.gz')
md5sums=('6628cad808d13bedb20054eea84b0f72')
sha512sums=('1dde1d2592e0123c5153811d659dffae2895f7404460a96fa25f860b4536bb569782fc920afeed72b2862478616421995096bbaec864df68036fa4bef5216115')
_distdir="PBKDF2-Tiny-0.005"

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
