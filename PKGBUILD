# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-cloudstack'
pkgver='0.01005'
pkgrel='1'
pkgdesc="Bindings for the CloudStack API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-message' 'perl-json' 'perl-libwww' 'perl-mouse' 'perl-uri-encode' 'perl-xml-simple' 'perl-xml-twig')
makedepends=()
url='http://search.cpan.org/dist/Net-CloudStack'
source=('http://search.cpan.org/CPAN/authors/id/S/SN/SNUMANO/Net-CloudStack-0.01005.tar.gz')
md5sums=('82877a90b7c39f3431585edfaf122836')
sha512sums=('b0e8450f2cf701f77c2ee2a104ed331b10137482a87fd48a694c319d498439a7a7357b877ff0740fda39d11ecd4d9a32084ae1d8c8d1cfd64ac853f0660a72c5')
_distdir="Net-CloudStack-0.01005"

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
