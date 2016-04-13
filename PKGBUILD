# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mime-charset'
pkgver='1.012'
pkgrel='1'
pkgdesc="Charset Information for MIME"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/MIME-Charset'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEZUMI/MIME-Charset-1.012.tar.gz')
md5sums=('1762b0d9e9379be684b704c247317276')
sha512sums=('f116deb04912bdccfd98484ef82d643d23b4cb90bfdf88ddc60d0a3f857ac3f084a60681a6fae4f9a2d982d6f470c79f171688e44a4034e9533bb518a914e2fe')
_distdir="MIME-Charset-1.012"

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
