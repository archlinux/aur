# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-cups'
pkgver='0.63'
pkgrel='1'
pkgdesc="Common Unix Printing System Interface"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'e2fsprogs>=1.43.4' 'glibc>=2.25' 'krb5>=1.13.7' 'libcups>=2.2.3' 'zlib>=1:1.2.11')
makedepends=()
url='https://metacpan.org/release/Net-CUPS'
source=('http://search.cpan.org/CPAN/authors/id/N/NI/NINE/Net-CUPS-0.63.tar.gz')
md5sums=('d4446a98ede418bb7bb6f6cb2a01965b')
sha512sums=('ac407d1a0ebb686cd1f12f76516581073da90cf129a24ef57f10facf0a879ee9a13bdf0b498163c998030f9ec837fc237f440d24894e997e7e57ad2a13693b8a')
_distdir="Net-CUPS-0.63"

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
