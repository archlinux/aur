# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-javascript-v8'
pkgver='0.07'
pkgrel='1'
pkgdesc="Perl interface to the V8 JavaScript engine"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-extutils-xspp>=0.11' 'v8-3.14')
makedepends=()
url='https://metacpan.org/release/JavaScript-V8'
source=('http://search.cpan.org/CPAN/authors/id/D/DG/DGL/JavaScript-V8-0.07.tar.gz')
md5sums=('88e34b4706916c10b9fc37cde7cad1ab')
sha512sums=('dea46904f3dd24a2ed1eca35a67bde7b0df50b9bfad7eca29e0680fc18027a22f7d02c22ffc6d97cbffafc0afb2222dda830c33183c9e4a60f672debb881bcca')
_distdir="JavaScript-V8-0.07"

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
