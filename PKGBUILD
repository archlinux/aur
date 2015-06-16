# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-xml-hash-xs'
pkgver='0.42'
pkgrel='1'
pkgdesc="Simple and fast hash to XML and XML to hash conversion"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.21' 'icu>=55.1' 'libxml2>=2.9.2' 'perl' 'zlib>=1.2.8')
makedepends=()
url='https://metacpan.org/release/XML-Hash-XS'
source=('http://search.cpan.org/CPAN/authors/id/Y/YO/YOREEK/XML-Hash-XS-0.42.tar.gz')
md5sums=('07cd065f2a3e8798a7a5e333ce3b8b7f')
sha512sums=('c37298df0d0af2f45d8f82fde124b8ae65c433305dec8727703161a29b99dee6f19a34e0cc7e148145aed4c9a508871e681aa6ac3fe4b508800b3879f344b3e9')
_distdir="XML-Hash-XS-0.42"

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
