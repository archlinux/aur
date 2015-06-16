# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-ident'
pkgver='1.23'
pkgrel='1'
pkgdesc="Lookup the username on the remote end of a TCP/IP connection"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Net-Ident'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TODDR/Net-Ident-1.23.tar.gz')
md5sums=('f9a2943dc6310c1f31458c49f926b007')
sha512sums=('a8aa80d4d9d3b8b9368fb8ad6e213a5c81bdea7530db685ffd143306f7d239e4db737086903c76edc8aa1e6c1366ce98eedaffe357dd43cf8d54c598a13e6337')
_distdir="Net-Ident-1.23"

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
