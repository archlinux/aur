# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-time-fake'
pkgver='0.11'
pkgrel='1'
pkgdesc="Perl/CPAN Module Time::Fake: Simulate different times without changing your system clock"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Time-Fake'
source=("http://search.cpan.org/CPAN/authors/id/R/RO/ROSULEK/Time-Fake-$pkgver.tar.gz")
md5sums=('bb453d8fd6df42eb31cbd585af407d2a')
sha512sums=('b9f2c6a1327837bd665bee0cde9c94ae86abc6f92d181e8364015c10d834acf80704a688c4666d03c0a871d98a8bde684f83f52f3817765894bb90319dc037b4')
_distdir="Time-Fake-$pkgver"

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
