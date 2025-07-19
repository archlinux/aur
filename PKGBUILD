# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-html-formattext-withlinks'
pkgver='0.15'
pkgrel='3'
pkgdesc="HTML to text conversion with links as footnotes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-formatter>=0' 'perl-html-tree>=0' 'perl-uri>=0')
makedepends=()
url='https://metacpan.org/release/HTML-FormatText-WithLinks'
source=("http://search.cpan.org/CPAN/authors/id/S/ST/STRUAN/HTML-FormatText-WithLinks-$pkgver.tar.gz")
md5sums=('e048c41f600895182df327c6ce9b2cc0')
sha512sums=('cdec4ba94c3f9dfd4e9c8b03be0e24068b23b634499bce062e0b281b26ad3a0288c0d4cc35b4db62fd81ad5f0a0f9ce42a59478af10a81ca2f5901ab79cdf550')
_distdir="HTML-FormatText-WithLinks-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
