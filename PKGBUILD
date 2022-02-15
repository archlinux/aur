# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: Jens Adam <jra@byte.cx>
# Contributor: jsteel <jsteel at aur.archlinux.org>
# Contributor: Marvin Lampe <marvin.lampe@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-universal-require'
pkgver='0.19'
pkgrel='1'
pkgdesc="Perl/CPAN Module UNIVERSAL::require: require() modules from a variable"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/UNIVERSAL-require'
source=("http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/UNIVERSAL-require-$pkgver.tar.gz")
md5sums=('d0fbbc0eda9bcdc4c77a0f4f1a2bffec')
sha512sums=('065a361a7605aa2827ad14eeecea23a2238df2cc477c73ea2facd475953000d0c6f8773db886333295501e6d2602dd08e2f9a81d77b4f3a4c3926dcc57358cb2')
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
