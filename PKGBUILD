# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: Jens Adam <jra@byte.cx>
# Contributor: jsteel <jsteel at aur.archlinux.org>
# Contributor: Marvin Lampe <marvin.lampe@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-universal-require'
pkgver='0.18'
pkgrel='2'
pkgdesc="Perl/CPAN Module UNIVERSAL::require: require() modules from a variable"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/UNIVERSAL-require'
source=("http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/UNIVERSAL-require-$pkgver.tar.gz")
md5sums=('2cdfd54bc7e270c77456a8e929a091b3')
sha512sums=('4e1dbb62f850a2f3da3301e37862d03ad89106e9fd55ac8161ae56eff936948f87b9215c734c103d8031e1b712847bff86de43329f65f00e7e34ee83bb66c22d')
_distdir="UNIVERSAL-require-$pkgver"

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
