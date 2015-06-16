# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-text-emoticon'
pkgver='0.04'
pkgrel='1'
pkgdesc="Factory class for Yahoo! and MSN emoticons"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-universal-require')
makedepends=()
url='http://search.cpan.org/dist/Text-Emoticon'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Text-Emoticon-0.04.tar.gz')
md5sums=('a9aef67754feabb94c75a0756909aae1')
sha512sums=('3803e54b26b8c33beadd99b02ada75e34af8575c6f0d9d8257cd63bce35a59195a2eff23a3ca5e2db570f7afd0c143190bdc5469c00819d89c9935aef9385afb')
_distdir="Text-Emoticon-0.04"

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
