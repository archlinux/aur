# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-ooorno'
pkgver='0.011'
pkgrel='1'
pkgdesc="Give your module classic AND OO interfaces"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Class-OOorNO'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOMMY/Class-OOorNO-0.011.tar.gz')
md5sums=('1fddbef2595f4b833646fe92ea0db45b')
sha512sums=('1883983c9c6903b2dfae30b9792385f79134c1260fa94ef773609f179b1741a3962ca5d9913f18615e972c052f92152341ee8b6b4e26c905127f043d233a55c4')
_distdir="Class-OOorNO-0.011"

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
