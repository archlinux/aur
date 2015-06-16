# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-iptrie'
pkgver='0.7'
pkgrel='1'
pkgdesc="Perl module for building IPv4 and IPv6 address space hierarchies"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-netaddr-ip>=4.007')
makedepends=()
url='http://search.cpan.org/dist/Net-IPTrie'
source=('http://search.cpan.org/CPAN/authors/id/C/CV/CVICENTE/Net-IPTrie-0.7.tar.gz')
md5sums=('c465a27fdac74109b34dfbc271adb90d')
sha512sums=('6f1033f078aeed7d76dfc5f7a5a55c02601205c8b3e1626ecee6205e136c3c736cfb658b4f48cd24fba5491f2cb44a793cd942752f03489f40decbf242f80aad')
_distdir="Net-IPTrie-0.7"

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
