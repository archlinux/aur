# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-dns-native'
pkgver='0.15'
pkgrel='1'
pkgdesc="non-blocking system DNS resolver"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'glibc>=2.22')
makedepends=()
url='https://metacpan.org/release/Net-DNS-Native'
source=('http://search.cpan.org/CPAN/authors/id/O/OL/OLEG/Net-DNS-Native-0.15.tar.gz')
md5sums=('d555d2291a27990821bafb09821238c4')
sha512sums=('5744f548baee4b8f1f06be588e9f4031c8aaa7bce72250b7590ddac3e7abe3f65003594c867e5109be63ae938199496702f950d22b93312902810b9a1586e5e3')
_distdir="Net-DNS-Native-0.15"

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
