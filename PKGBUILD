# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-tkx'
pkgver='1.09'
pkgrel='1'
pkgdesc="Yet another Tk interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-tcl>=1')
makedepends=()
url='http://search.cpan.org/dist/Tkx'
source=('http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Tkx-1.09.tar.gz')
md5sums=('8dfe38d1b7c6a92101e840949c584d7d')
sha512sums=('061942367ba042b2044ac75cd7e7451ef1f5e3748204c60708d44dd8a360237f81023463badaa94a28c7d3b913b9196b5945f8a577baf2e8a376fdfd91877177')
_distdir="Tkx-1.09"

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
