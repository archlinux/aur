# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-convert-bencode'
pkgver='1.03'
pkgrel='1'
pkgdesc="Functions for converting to/from bencoded strings"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Convert-Bencode'
source=('http://search.cpan.org/CPAN/authors/id/O/OR/ORCLEV/Convert-Bencode-1.03.tar.gz')
md5sums=('be0831c69fe581908d33bbebff0b5760')
sha512sums=('880ca4acff1e93b3bddf837921225d31bb0a697214db5eec8f906897b305ddc4d11b67587e5cae43b0dd7e4aa6c3bee6aee172c51750a3b70929ac3c99b8f582')
_distdir="Convert-Bencode-1.03"

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
