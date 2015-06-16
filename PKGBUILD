# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-pegex'
pkgver='0.60'
pkgrel='1'
pkgdesc="Acmeist PEG Parser Framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-yaml-libyaml' 'perl-file-sharedir')
makedepends=()
url='https://metacpan.org/release/Pegex'
source=('http://search.cpan.org/CPAN/authors/id/I/IN/INGY/Pegex-0.60.tar.gz')
md5sums=('347f72c1c0347148d80058ea35927df8')
sha512sums=('e0ea53d38ad889cef33d3121acbc0dd265cea3a9396100266be9c3f1a2b4d43fc18f752087d8f95830783d18b9d18bcecd36a91bde756b6eb5dd900b661338c5')
_distdir="Pegex-0.60"

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
