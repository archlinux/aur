# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-term-readline-perl'
pkgver='1.0303'
pkgrel='1'
pkgdesc="Pure Perl Term::Readline"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Term-ReadLine-Perl'
source=('http://search.mcpan.org/CPAN/authors/id/I/IL/ILYAZ/modules/Term-ReadLine-Perl-1.0303.tar.gz')
md5sums=('a77ecf4921cc714820fef898c6cb0eaf')
sha512sums=('df6a9f4ff2e02b0b0bc6b990fc2be091be7609322476f74bb6628148543804e30ac44ded991e7f8655bb25ecedf8e53497be6d0ce80b395edce35b9d84ad7937')
_distdir="Term-ReadLine-Perl-1.0303"

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
