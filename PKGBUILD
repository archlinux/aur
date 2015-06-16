# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-text-emoticon-yahoo'
pkgver='0.02'
pkgrel='1'
pkgdesc="Emoticon filter of Yahoo! Messenger"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-text-emoticon>=0.02')
makedepends=()
url='http://search.cpan.org/dist/Text-Emoticon-Yahoo'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Text-Emoticon-Yahoo-0.02.tar.gz')
md5sums=('6e732c4dacf0741f8c010da5d397515d')
sha512sums=('072f8c356e343510c83e9bfc47629a4bbd68bb403ee40a967b5ec8106890965ecef171bdc44bc686c89f546c696b3115564839f342acc472fbca750247e9e9ec')
_distdir="Text-Emoticon-Yahoo-0.02"

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
