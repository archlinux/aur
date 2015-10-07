# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-xml-hash-xs'
pkgver='0.43'
pkgrel='1'
pkgdesc="Simple and fast hash to XML and XML to hash conversion"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.22' 'icu>=55.1' 'libxml2>=2.9.2' 'perl>=5.8.8' 'zlib>=1.2.8')
makedepends=()
url='https://metacpan.org/release/XML-Hash-XS'
source=('http://search.cpan.org/CPAN/authors/id/Y/YO/YOREEK/XML-Hash-XS-0.43.tar.gz')
md5sums=('0bcd1562601ed07f36bb8ddf4d913a33')
sha512sums=('82a09e2c399bd2bfd5c67efe5aea8cdf1395f954be8b945ec6a8662604ced02f857656c8ac21b4fd3564f1b113ab2e5c7d6709abea0ead0d98c0e9373c9c29b7')
_distdir="XML-Hash-XS-0.43"

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
