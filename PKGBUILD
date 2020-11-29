# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-class-adapter'
pkgver='1.09'
pkgrel='1'
pkgdesc="Perl/CPAN Module Class::Adapter: Perl implementation of the \"Adapter\" Design Pattern"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Class-Adapter'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Class-Adapter-$pkgver.tar.gz")
md5sums=('703c3d13e991f300ab2ed0a47931d6ab')
sha512sums=('e6b7bde685683fa733e3002cf815aca6e298b2200a3fedbef93345284507023cdeed0cda4232c53d4dfd89239271a871db44616606d88ff5d03ac7c3e33a992a')
_distdir="Class-Adapter-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
