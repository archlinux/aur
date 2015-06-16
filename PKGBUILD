# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-plack-middleware-static-minifier'
pkgver='0.071'
pkgrel='1'
pkgdesc="serves static files and minify CSS and JavaScript"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.7' 'perl-css-minifier-xs' 'perl-javascript-minifier-xs' 'perl-plack>=0.9958')
makedepends=('perl-http-message')
url='http://search.cpan.org/dist/Plack-Middleware-Static-Minifier'
source=('http://search.cpan.org/CPAN/authors/id/B/BA/BAYASHI/Plack-Middleware-Static-Minifier-0.071.tar.gz')
md5sums=('43c122569cab300c517c0a555a646e79')
sha512sums=('b86c817906a7255fd061e6f117473697e82179b7cb0b3cc6be9f02606aadac951702c9579fc2189e921080b89b6523d559aa30fbc3bf9100e0933a983984e7df')
_distdir="Plack-Middleware-Static-Minifier-0.071"

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
