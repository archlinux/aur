# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-hash-fieldhash'
pkgver='0.14'
pkgrel='1'
pkgdesc="Lightweight field hash for inside-out objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.5')
makedepends=('perl-test-leaktrace>=0.07')
url='http://search.cpan.org/dist/Hash-FieldHash'
source=('http://search.cpan.org/CPAN/authors/id/G/GF/GFUJI/Hash-FieldHash-0.14.tar.gz')
md5sums=('343747e35714e968ff3db39609e246ca')
sha512sums=('25c13a103ee8e643ae08ad47b5ba2f9f35a43c2f1ac3812b52c8893f15cc52aabf6f923282491839feb306294dae6878e3a102e21e78d51eebc9e954b4792d99')
_distdir="Hash-FieldHash-0.14"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
