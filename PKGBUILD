# Contributor: Marc Cousin <cousinmarc@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-validate-struct'
pkgver='0.1'
pkgrel='1'
pkgdesc="Validate recursive Hash Structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-validate>=0.06' 'perl-data-validate-ip>=0.18' 'perl-regexp-common>=0')
makedepends=()
url='https://metacpan.org/release/Data-Validate-Struct'
source=('http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/Data-Validate-Struct-0.1.tar.gz')
md5sums=('a66c8c5cbadc0c9742e7c0cb3eb5bc41')
sha512sums=('c85b1352aec2fb0822e1502ed7b89d5bf8aebb931e74497b2a46f680acce4ab5316f242028734fd7ff262f3eb741d7edc638c5557c50a79addbb35333816d617')
_distdir="Data-Validate-Struct-0.1"

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
