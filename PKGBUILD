# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-uri-db
pkgver=0.23
pkgrel=1
pkgdesc="Perl module representing database URIs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs' 'purge')
depends=('perl-uri>=1.40' 'perl-uri-nested>=0.10')
makedepends=('perl-module-build>=0.30')
url='https://metacpan.org/release/URI-db'
source=('http://search.cpan.org/CPAN/authors/id/D/DW/DWHEELER/URI-db-0.23.tar.gz')
md5sums=('8fbb0a515ed17164c0e1bb5873a811d9')
sha512sums=('1955d22a0e12ad936423184d8ac7337f99bd595638d4cff879b78475036f60e23a76ab6d701bb4060bc0b43fbaeba1975f285fb5dd1b4af7c199cbc02d5a01a1')
_distdir="URI-db-0.23"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
