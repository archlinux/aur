# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-text-emoticon-googletalk'
pkgver='0.01'
pkgrel='1'
pkgdesc="Emoticon filter of GoogleTalk"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Text-Emoticon-GoogleTalk'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Text-Emoticon-GoogleTalk-0.01.tar.gz')
md5sums=('e3336970e95dedc675394c1fda090335')
sha512sums=('5e69d87004eb5a7b22894521f88bedb24b0ad5e455a83ed980fd0e896dc7581c3195964e1bd460220625477e224f621d4e0a8661dc254cda28adc99f5ecfacc8')
_distdir="Text-Emoticon-GoogleTalk-0.01"

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
