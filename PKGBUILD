# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-uri-db'
pkgver='0.15'
pkgrel='1'
pkgdesc="URI::db - Database URIs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-uri>=1.40' 'perl-uri-nested>=0.10' 'perl')
makedepends=()
url='http://search.mcpan.org/dist/URI-db'
source=('http://search.mcpan.org/CPAN/authors/id/D/DW/DWHEELER/URI-db-0.15.tar.gz')
md5sums=('1bcc2205ce7ffd393634127d699bf971')
sha512sums=('9331c3b7da20e1a8a4500f069f34e04459c214147b116386c4413a0a88a55671a8be42285c4a3ddb5eba5d7d8dbfa4527029a7ccf3444193609777756bf8d3bb')
_distdir="URI-db-0.15"

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
