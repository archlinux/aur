# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-bbcode'
pkgver='2.07'
pkgrel='1'
pkgdesc="Perl extension for converting BBcode to HTML."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-stripscripts>=1.04' 'perl-html-stripscripts-parser' 'perl-uri')
makedepends=()
url='http://search.cpan.org/dist/HTML-BBCode'
source=('http://search.cpan.org/CPAN/authors/id/B/BL/BLOM/HTML-BBCode-2.07.tar.gz')
md5sums=('54a4acc8509f3edeae4b604cfa13d2a9')
sha512sums=('ae982c44bd5dd7bc60fbb5406fba765878a988586040dab453d9622a52f39ec7cc596040998e60d406d2fa0e7a4aff6c7228fb93f95bcfad3cb5876d8f6d1ff0')
_distdir="HTML-BBCode-2.07"

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
