# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-text-xslate'
pkgver='3.3.3'
pkgrel='1'
pkgdesc="Scalable template engine for Perl5"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-messagepack>=0.38' 'perl-mouse>=0.61' 'perl>=5.8.1')
makedepends=('perl-file-copy-recursive')
checkdepends=('perl-test-requires')
url='http://search.mcpan.org/dist/Text-Xslate'
source=('http://search.mcpan.org/CPAN/authors/id/S/SY/SYOHEX/Text-Xslate-3.3.3.tar.gz')
md5sums=('95d1195448276d450e39c696636abb44')
sha512sums=('d20aee0118f3e32c7d4efd2681bcf9af2fd29a2e9f81753804e7fe9bbe5172cf8ed2a8f876661c823505fce27c82a707d39bfb41149a6296da821f140212f8d9')
_distdir="Text-Xslate-3.3.3"

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
