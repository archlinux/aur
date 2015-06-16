# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-locale-maketext-simple'
pkgver='0.21'
pkgrel='1'
pkgdesc="Simple interface to Locale::Maketext::Lexicon"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Locale-Maketext-Simple'
source=('http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/Locale-Maketext-Simple-0.21.tar.gz')
md5sums=('0a7c5c3b18cf31d764e1631eb9a3d367')
sha512sums=('832719d5852de04027c27afa6533937b42c779405d556e6d7e302e51905db5cd28779b5f482154b23622c5c04fc61965399b75fac7e1369d7a94b0aa5653415a')
_distdir="Locale-Maketext-Simple-0.21"

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
