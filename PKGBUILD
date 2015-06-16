# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-digest-whirlpool'
pkgver='1.09'
pkgrel='1'
pkgdesc="A 512-bit, collision-resistant, one-way hash function"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Digest-Whirlpool'
source=('http://search.cpan.org/CPAN/authors/id/A/AV/AVAR/Digest-Whirlpool-1.09.tar.gz')
md5sums=('852a7672ef11d46b229c0be77330e991')
sha512sums=('f8e5ee280d2e4fbe0fa34d52455ccbdd281c6206980da52ae12b6a03d10dff7fbea43a224ca8bb070d6bce8128e9363a9baccd276236b3b1eba1e8a969021252')
_distdir="Digest-Whirlpool-1.09"

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
