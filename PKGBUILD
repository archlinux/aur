# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-indirect'
pkgver='0.39'
pkgrel='1'
pkgdesc="Perl/CPAN Module indirect: Lexically warn about using the indirect method call syntax."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/indirect'
source=("http://search.cpan.org/CPAN/authors/id/V/VP/VPIT/indirect-$pkgver.tar.gz")
md5sums=('3509a7e745959e683318c5db1bb02ef4')
sha512sums=('d3275a2cab2eeceef61756e08947d3072c0ce5cea2e8b70870c5fcbd9c63e56cf70568395002b7d02060cad3482f7f56723b1ad85fcf0a4c4ee2568b5035816c')
_distdir="indirect-$pkgver"

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
