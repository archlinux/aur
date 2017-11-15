# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Alex Kubica <alexkubicail@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-text-bidi'
pkgver='2.12'
pkgrel='2'
pkgdesc="Perl/CPAN Module Text::Bidi: Unicode bidi algorithm using libfribidi"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('fribidi>=0.19.7' 'perl>=5.10.0')
makedepends=()
url='https://metacpan.org/release/Text-Bidi'
source=("http://search.cpan.org/CPAN/authors/id/K/KA/KAMENSKY/Text-Bidi-$pkgver.tar.gz")
md5sums=('075019229cd1e6ce452494fb87959f32')
sha512sums=('02e391ec1324cad2577ddbf823214dea5e8cd7f846c6d5f16367da90ca3db0c15922a08233f5877f9f223ed9a89374177f488001bd539859dc49e850a2577053')
_distdir="Text-Bidi-$pkgver"

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
