# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-wikiconverter-mediawiki'
pkgver='0.59'
pkgrel='1'
pkgdesc="Convert HTML to MediaWiki markup"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-wikiconverter>=0.63' 'perl-uri>=1.35')
makedepends=()
url='http://search.cpan.org/dist/HTML-WikiConverter-MediaWiki'
source=('http://search.cpan.org/CPAN/authors/id/D/DI/DIBERRI/HTML-WikiConverter-MediaWiki-0.59.tar.gz')
md5sums=('72b776cce2a1dddd48017655097b4d04')
sha512sums=('24d466f2141d8142c2e8860f6ae12e88ceadfd7b1578a9db4b083d29616dd86ec70454e15fef43ec9fa577590722c09261513154f90698f02986feec63fc31b7')
_distdir="HTML-WikiConverter-MediaWiki-0.59"

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
