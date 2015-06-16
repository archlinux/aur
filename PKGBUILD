# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-weather-google'
pkgver='0.06'
pkgrel='1'
pkgdesc="Perl interface to Google's Weather API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww' 'perl-xml-simple')
makedepends=('perl-test-pod' 'perl-test-warn')
url='http://search.cpan.org/dist/Weather-Google'
source=('http://search.cpan.org/CPAN/authors/id/P/PO/POSSUM/Weather-Google-0.06.tar.gz')
md5sums=('ff038bd02c2db6cff6abcbee4e0ed55b')
sha512sums=('805ae8e623a7851f938601715d8dbaa74f5d95b1009dbfa2abc51236039be3c2bd732a3e96d7f76ccae26e683b99d233f4b1aaf6e8739f70c3422eb8cf149bd3')
_distdir="Weather-Google-0.06"

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
