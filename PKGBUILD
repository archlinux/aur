# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-net-cidr'
pkgver='0.17'
pkgrel='2'
pkgdesc="Manipulate IPv4/IPv6 netblocks in CIDR notation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Net-CIDR'
source=('http://search.mcpan.org/CPAN/authors/id/M/MR/MRSAM/Net-CIDR-0.17.tar.gz')
md5sums=('c4632887a13663c7ba769bd6ba1b3c26')
sha512sums=('bb1ad29f79879e46afc221ddec1d790ea69d470e7363dc90e27ec3fb34e15cf753b457b76a4ea0e70db4afc0aeb11f3e2bbe7c204abb5aae967d13ae9605460f')
_distdir="Net-CIDR-0.17"

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
