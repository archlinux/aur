# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-deep-json'
pkgver='0.05'
pkgrel='2'
pkgdesc="Compare JSON with Test::Deep"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exporter-lite>=0' 'perl-json-maybexs>=0' 'perl-test-deep>=0' 'perl>=5.8.1')
makedepends=('perl-module-build-tiny')
url='https://metacpan.org/release/Test-Deep-JSON'
source=('http://search.cpan.org/CPAN/authors/id/M/MO/MOTEMEN/Test-Deep-JSON-0.05.tar.gz')
md5sums=('4919d51563bb5277b4ea3be72dfafd5a')
sha512sums=('d2fc5d753445c16f38983ef7d0948eb85a5846299a2b7df5b288cc9585e2f658725e5ede6fb21a4e4f69ab1c500fa88f93273460dbc4fc7a7cc0ee1e20a33201')
_distdir="Test-Deep-JSON-0.05"

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
