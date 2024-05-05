# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lingua-en-inflect-phrase'
pkgver='0.20'
pkgrel='1'
pkgdesc="Perl/CPAN Module Linua::EN::Inflect::Phrase: Inflect short English Phrases"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-lingua-en-findnumber' 'perl-lingua-en-inflect' 'perl-lingua-en-inflect-number' \
  'perl-lingua-en-number-isordinal' 'perl-lingua-en-tagger')
makedepends=()
checkdepends=('perl-test-nowarnings')
url='https://metacpan.org/release/Lingua-EN-Inflect-Phrase'
source=("http://search.cpan.org/CPAN/authors/id/R/RK/RKITOVER/Lingua-EN-Inflect-Phrase-${pkgver}.tar.gz")
md5sums=('cbb7861033f3a7076854ad015949c86f')
sha512sums=('880e5e57580a0d178467700539f43029664a40a0b177a3b4fd8bd061db4082bc9618f15b26322ad1321d7fd21f09cb217a4f2bbf4badc72282d869a4e4ffcdc8')
_distdir="Lingua-EN-Inflect-Phrase-${pkgver}"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
