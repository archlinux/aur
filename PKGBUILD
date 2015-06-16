# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-html-formattext-withlinks'
pkgver='0.14'
pkgrel='1'
pkgdesc="HTML to text conversion with links as footnotes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-format>=0' 'perl-html-tree>=0' 'perl-uri>=0')
makedepends=()
url='http://search.cpan.org/dist/HTML-FormatText-WithLinks'
source=('http://search.cpan.org/CPAN/authors/id/S/ST/STRUAN/HTML-FormatText-WithLinks-0.14.tar.gz')
md5sums=('264a1436883d20b81e669c65a1f97367')
sha512sums=('ec2cf859401985aaac45ba5ae1da18b3a142d51d821154ad40497a1ec468d86a6a6b85d7a1a66ec2d06bac49fe699def702c4cad86f1fa52da364cb29b6994b7')
_distdir="HTML-FormatText-WithLinks-0.14"

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
