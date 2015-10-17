# Contributor: Mateusz Krasowski <matkras@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-autobox-core'
pkgver='1.29'
pkgrel='1'
pkgdesc="Provide core functions to autoboxed scalars, arrays and hashes."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-autobox>=2.71')
makedepends=()
url='http://search.cpan.org/dist/autobox-Core'
source=('http://search.cpan.org/CPAN/authors/id/X/XE/XENU/autobox-Core-1.29.tar.gz')
md5sums=('10b0f4c908542e034a2a423a358ab420')
_distdir="autobox-Core-1.29"

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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
