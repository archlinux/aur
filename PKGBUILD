# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Kars Wang <jaklsy AT gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sereal-decoder'
pkgver='4.018'
pkgrel='1'
pkgdesc="Perl/CPAN Module Sereal::Decoder: Fast, compact, powerful binary deserialization"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'zstd>=1.4.5')
makedepends=()
checkdepends=('perl-test-deep' 'perl-test-differences' 'perl-test-longstring' 'perl-test-warn')
url='https://metacpan.org/release/Sereal-Decoder'
source=("http://search.cpan.org/CPAN/authors/id/Y/YV/YVES/Sereal-Decoder-$pkgver.tar.gz")
md5sums=('1619ac6237f12dae898be1ee25708933')
sha512sums=('18e4d54c1930187fbcfc39a39ef8512c1450ac3e5d22bee419e8333cbda1e08bcb1355bc2abfc388f9d45dfae3b8bcc101a19646b7caa670359bae98fccf87a3')
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
