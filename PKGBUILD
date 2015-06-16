# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-wikiconverter-moinmoin'
pkgver='0.54'
pkgrel='1'
pkgdesc="Convert HTML to MoinMoin markup"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-wikiconverter>=0.63' 'perl-params-validate' 'perl-uri')
makedepends=()
url='http://search.cpan.org/dist/HTML-WikiConverter-MoinMoin'
source=('http://search.cpan.org/CPAN/authors/id/D/DI/DIBERRI/HTML-WikiConverter-MoinMoin-0.54.tar.gz')
md5sums=('4fbc0ad12f3b3d12d8edd63c3d8c6182')
sha512sums=('24f98092e7d65e6c5913019ffb727aa969bdb326db4ba05407d5bc345341efd9bf4bb0102cd311f479f03f19561f4b1e754c56f8e8d1f02dffe6b48a8894ced9')
_distdir="HTML-WikiConverter-MoinMoin-0.54"

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
