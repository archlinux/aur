# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-plugin-compress'
pkgver='0.005'
pkgrel='1'
pkgdesc="Compress response"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=5.80001' 'perl-mro-compat')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-Plugin-Compress'
source=('http://search.cpan.org/CPAN/authors/id/X/XI/XINMING/Catalyst-Plugin-Compress-0.005.tar.gz')
md5sums=('16df22840090b768e2a5e5fa69d6109e')
sha512sums=('9bce2aa53e30150d0989b0c719a3a83b7435e31a66a76168e72fdb80aa20aa5a5048fa478e81e94cbfb4e951a2ed474e86abba30e13a807fad2c118ea4af4824')
_distdir="Catalyst-Plugin-Compress-0.005"

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
