# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-wikiconverter-googlecode'
pkgver='0.12'
pkgrel='1'
pkgdesc="Convert HTML to Google Code wiki markup."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-wikiconverter>=0.61' 'perl-params-validate' 'perl-uri')
makedepends=()
url='http://search.cpan.org/dist/HTML-WikiConverter-GoogleCode'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARTYKUBE/HTML-WikiConverter-GoogleCode-0.12.tar.gz')
md5sums=('b7e2e9e9825edab284ff8992e2d14d57')
sha512sums=('06cf1e31306f72a300531f7c88cb1c17a998df0ad5710a71c696f33a522bf14f4e941e850d0708d238445d30d43a2eb84fc2dc537f0800b26445d76388e19bff')
_distdir="HTML-WikiConverter-GoogleCode-0.12"

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
