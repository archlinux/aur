# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Kars Wang <jaklsy AT gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sereal-decoder'
pkgver='5.001'
pkgrel='1'
pkgdesc="Perl/CPAN Module Sereal::Decoder: Fast, compact, powerful binary deserialization"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'zstd>=1.5.2')
makedepends=()
checkdepends=('perl-test-deep' 'perl-test-differences' 'perl-test-longstring' 'perl-test-warn')
url='https://metacpan.org/release/Sereal-Decoder'
source=("http://search.cpan.org/CPAN/authors/id/Y/YV/YVES/Sereal-Decoder-$pkgver.tar.gz")
md5sums=('c949510fb20990c26c5cf3984a29f265')
sha512sums=('942beb727b48e9afd27fae23a631f247ae80e21f13b3ba9fb49b46422faeb923d19d90701bd2bd546c7614e1995d96b9105326a301318dfbd405700d9f3f1dd0')
_distdir="Sereal-Decoder-$pkgver"

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
