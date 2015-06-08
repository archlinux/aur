# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-html5-sanity'
pkgver='0.104'
pkgrel='1'
pkgdesc="make HTML5 DOM trees less insane"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.010' 'perl-role-commons' 'perl-xml-libxml>=1.70')
makedepends=('perl-xml-libxml-debugging')
url='http://search.cpan.org/dist/HTML-HTML5-Sanity'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/HTML-HTML5-Sanity-0.104.tar.gz')
md5sums=('8081c47fb1ead4918f44539242d40874')
sha512sums=('93d631a3b2ef385403a0f814871283e0a45fd100feb1120fa65985ea60df56e31b0ae3c257e94414c18fed024849fa110ccf3b6ca9cb11d5c661f85d00ec0c00')
_distdir="HTML-HTML5-Sanity-0.104"

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
