# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-xml-semanticdiff'
pkgver='1.0004'
pkgrel='1'
pkgdesc="Perl extension for comparing XML documents."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-parser' 'perl>=5.006')
makedepends=()
url='http://search.mcpan.org/dist/XML-SemanticDiff'
source=('http://search.mcpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-SemanticDiff-1.0004.tar.gz')
md5sums=('0d13434cbc3eb2721b45c942ddb05d97')
sha512sums=('f600eaf7dbeab04e772df6795620ef3591925a4bef1b57623c8a068ad9edfec9ee6f29c63c896c4b58f71b662ada8e4a7c5ac3968b2ec563eb2848598f2ef4fb')
_distdir="XML-SemanticDiff-1.0004"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
