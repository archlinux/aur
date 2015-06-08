# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-html5-parser'
pkgver='0.301'
pkgrel='1'
pkgdesc="parse HTML reliably"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-html-html5-entities>=0.002' 'perl-io-html' 'perl-try-tiny' 'perl-uri' 'perl-xml-libxml>=1.94')
makedepends=()
url='http://search.cpan.org/dist/HTML-HTML5-Parser'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/HTML-HTML5-Parser-0.301.tar.gz')
md5sums=('3e7487de34232ddb1b65fab6b752ca5f')
sha512sums=('0bcee78541c9177f2577e1ecef0a858b95dbced9cc85fd3cb3b824d5d670a7a94a7f57d74e512e003ac1eece186d7949b13863cca8d47a7b72b91720188e0c2b')
_distdir="HTML-HTML5-Parser-0.301"

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
