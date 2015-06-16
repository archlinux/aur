# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-moosex-types-json'
pkgver='0.02'
pkgrel='1'
pkgdesc="JSON datatype for Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json-xs>=2.00' 'perl-moose>=0.82' 'perl-moosex-types>=0.15')
makedepends=()
url='http://search.cpan.org/dist/MooseX-Types-JSON'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MILA/MooseX-Types-JSON-0.02.tar.gz')
md5sums=('e6eb8745f38051ff471755759e6006c8')
sha512sums=('b6c072bae945243ee0efb4a230c31bb20d74d7eccddd3a4c5ae106e21e7eca59f85da5b49950d835d5d396d33cd003063e301728bcac846127ac58b7eb8bd451')
_distdir="MooseX-Types-JSON-0.02"

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
