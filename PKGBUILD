# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Kars Wang <jaklsy AT gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sereal'
pkgver='5.001'
pkgrel='1'
pkgdesc="Perl/CPAN Module Sereal: Fast, compact, powerful binary (de-)serialization"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-sereal-decoder>=5.001' 'perl-sereal-encoder>=5.001')
makedepends=()
checkdepends=('perl-test-deep' 'perl-test-differences' 'perl-test-longstring' 'perl-test-warn')
url='https://metacpan.org/release/Sereal'
source=("http://search.cpan.org/CPAN/authors/id/Y/YV/YVES/Sereal-$pkgver.tar.gz")
md5sums=('240daa0e59831b20134cc3b9016a3521')
sha512sums=('0be745e26e949f32e8267493a1001d169cf9252129dc8f506fbddb8880d20a40eb217cdff59536bdc23b62b8def7c3a53c19beb2afdc723838b4db03c9d1bfe4')
_distdir="Sereal-$pkgver"

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
