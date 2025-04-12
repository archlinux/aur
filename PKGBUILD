# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-hash-multivalue'
pkgver='0.16'
pkgrel='3'
pkgdesc="Perl/CPAN Module Hash::MultiValue: Store multiple values per key"
arch=('any')
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl>=5.8.1')
checkdepends=('perl-universal-ref')
makedepends=()
url='https://metacpan.org/release/Hash-MultiValue'
source=("http://search.cpan.org/CPAN/authors/id/A/AR/ARISTOTLE/Hash-MultiValue-${pkgver}.tar.gz")
md5sums=('508015312eb08cd2bcea987c4efbb93d')
sha512sums=('a6e1cab00ff24492bc84343b83a1282ad0eaded6633e7c511389dfb1d21cd8987dc2f1ad9ab69df69f36b651d68c70df3160666ff9ee584dbb1b6ab7095b78ac')
_distdir="Hash-MultiValue-${pkgver}"

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
