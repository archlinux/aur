# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Kars Wang <jaklsy AT gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sereal-encoder'
pkgver='4.023'
pkgrel='1'
pkgdesc="Perl/CPAN Module Sereal::Encoder: Fast, compact, powerful binary serialization"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-sereal-decoder>=4.002' 'zstd>=1.5.2')
makedepends=()
checkdepends=('perl-test-deep' 'perl-test-differences' 'perl-test-longstring' 'perl-test-warn')
url='https://metacpan.org/release/Sereal-Encoder'
source=("http://search.cpan.org/CPAN/authors/id/Y/YV/YVES/Sereal-Encoder-$pkgver.tar.gz")
md5sums=('c46d822f6b7113a9fd3c8c1f8ab115da')
sha512sums=('dc4b1b4e1d7977c1f7c8f00c7c0d1a475b785ccda29aee22a6cd09593000b176027d535f2820dd33de8820ec63cb2522d2eee4b6bd5cbbf432d5cf45437b9a67')
_distdir="Sereal-Encoder-$pkgver"

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
