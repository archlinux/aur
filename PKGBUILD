# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-apache-log-parser'
pkgver='0.02'
pkgrel='1'
pkgdesc="Parser for Apache Log (common, combined, and any other custom styles by LogFormat)."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-exception>=0')
url='http://search.cpan.org/dist/Apache-Log-Parser'
source=('http://search.cpan.org/CPAN/authors/id/T/TA/TAGOMORIS/Apache-Log-Parser-0.02.tar.gz')
md5sums=('29ccd3d42cacbab5f92ff9df8be6baaa')
sha512sums=('39fdffca9d0bced7f0e87950f2a1ba3e2687ca582c2cf6dee7b364fd93875d510bbeec52558d9fc522702c8dd01a080ab1dc33c5c8116c49a7a4eaf82a092ad7')
_distdir="Apache-Log-Parser-0.02"

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
