# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-cups'
pkgver='0.61'
pkgrel='1'
pkgdesc="Common Unix Printing System Interface"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('e2fsprogs>=1.42.8' 'glibc>=2.17' 'krb5>=1.11.3' 'libcups>=1.6.2' 'perl' 'zlib>=1.2.8')
makedepends=()
url='http://search.cpan.org/dist/Net-CUPS'
source=('http://search.cpan.org/CPAN/authors/id/D/DH/DHAGEMAN/Net-CUPS-0.61.tar.gz')
md5sums=('1aba74db9bcf15396005091f826b50e8')
sha512sums=('6e906dfebd7a5970f393f8187808049004d6b89fc268bb89abb4dca43145ec97ea45dd3faa51a04de2843a2aedc8051bcb88ab688f4a9886acc188166e2c2cf7')
_distdir="Net-CUPS-0.61"

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
