# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-schedule-at'
pkgver='1.15'
pkgrel='2'
pkgdesc="Perl/CPAN Module Schedule::At: OS independent interface to the Unix 'at' command"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'at')
makedepends=()
url='https://metacpan.org/release/Schedule-At'
source=("http://search.cpan.org/CPAN/authors/id/J/JO/JOSERODR/Schedule-At-$pkgver.tar.gz")
md5sums=('218b42b6ad2a2c2ddb0d54aeb0921496')
sha512sums=('15df903f990d4b72fd921fb838b00d61261c711fd963a03a6dad6a55ce86a3da268e5efa5446d477ba4bfe1e25d74ab703f4121411b79ac1001b55d136e4fd74')
_distdir="Schedule-At-$pkgver"

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
