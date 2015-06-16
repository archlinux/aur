# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-vars'
pkgver='0.005'
pkgrel='1'
pkgdesc="Detects unused variables"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.0')
makedepends=()
url='http://search.cpan.org/dist/Test-Vars'
source=('http://search.cpan.org/CPAN/authors/id/G/GF/GFUJI/Test-Vars-0.005.tar.gz')
md5sums=('56a763c785f66e4ae0edd2b4e613dc19')
sha512sums=('400bd7f7d6afd04ea54c80b2b1928288c0c7c5b2e85fcf440bf25f744d2abad22996bccd8f200753b78dd2ddec0aeacd5b99a353767bcc2169a21106429c3f6d')
_distdir="Test-Vars-0.005"

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
