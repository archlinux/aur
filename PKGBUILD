# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-mldbm'
pkgver='2.05'
pkgrel='1'
pkgdesc="store multi-level Perl hash structure in single level tied hash"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/MLDBM'
source=('http://search.mcpan.org/CPAN/authors/id/C/CH/CHORNY/MLDBM-2.05.tar.gz')
md5sums=('9b7ec37bfc36b0e83db9323be92beb50')
sha512sums=('410fae3a2bd2182a4b9ace64127a92cbebc850d4252b8e9ccf0f6710f7086d87769eed518cd0c237031a96767bcff28f6c9695eaabac4bb629dc554261c78d2a')
_distdir="MLDBM-2.05"

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
