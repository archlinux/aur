# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lingua-stem-snowball'
pkgver='0.952'
pkgrel='3'
pkgdesc="Perl/CPAN Module Lingua::Stem::Snowball: Perl interface to Snowball stemmers."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.2')
makedepends=('perl-module-build')
url='https://metacpan.org/release/Lingua-Stem-Snowball'
source=("http://search.cpan.org/CPAN/authors/id/C/CR/CREAMYG/Lingua-Stem-Snowball-$pkgver.tar.gz")
md5sums=('6b0085c6fd8ec894e34c593078aa169a')
sha512sums=('53e1f48094d60f2ca2fe4303119bb140ea166a619d5c0141925f62bbfaac0bb1d87053eb49bf5478144efea700ea9ecd7686b11bce94ab6f76fda7550b376c58')
_distdir="Lingua-Stem-Snowball-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    ./Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    ./Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  ./Build install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
