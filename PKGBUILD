# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-convert-tnef'
pkgver='0.18'
pkgrel='3'
pkgdesc="Perl module to read TNEF files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-stringy' 'perl-mime-tools')
makedepends=()
url='https://metacpan.org/release/Convert-TNEF'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOUGW/Convert-TNEF-0.18.tar.gz')
md5sums=('6f69ff242a807b861c6e68a3d93a58f7')
sha512sums=('00cbe54169c535e6d6d3b53a06eb47808a129d6397c73b5f2b53b93efba20f81d078c16edb7b0108bc037e2cb7f1c92719633519ea17088442ea8f63864eaf07')
_distdir="Convert-TNEF-0.18"

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
