# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Kars Wang <jaklsy AT gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sereal'
pkgver='4.018'
pkgrel='1'
pkgdesc="Perl/CPAN Module Sereal: Fast, compact, powerful binary (de-)serialization"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-sereal-decoder>=4.018' 'perl-sereal-encoder>=4.018')
makedepends=()
checkdepends=('perl-test-longstring' 'perl-test-warn')
url='https://metacpan.org/release/Sereal'
source=("http://search.cpan.org/CPAN/authors/id/Y/YV/YVES/Sereal-$pkgver.tar.gz")
md5sums=('ad37bd7a68537cc1cc9d078a95d0c58f')
sha512sums=('cfa4796efa2231b1f813fe15080c07cc1aac05a137041a74922e66737311b02859b8fd83d80c4f8f2dd79f13bda648dae8cf3a0f723c320aa09df177ddd77eec')
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
