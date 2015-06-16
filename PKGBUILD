# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-heap-simple-xs'
pkgver='0.10'
pkgrel='1'
pkgdesc="An XS implementation of the Heap::Simple interface"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-heap-simple>=0.09')
makedepends=()
url='http://search.cpan.org/dist/Heap-Simple-XS'
source=('http://search.cpan.org/CPAN/authors/id/T/TH/THOSPEL/Heap-Simple-XS-0.10.tar.gz')
md5sums=('0611ac7984f6ddc3aaa60c75d2257803')
sha512sums=('269840cf82c501d3d15971f3f901e36d984cc740bbb66f639e168c7bd83e4d6a9fff2c54b1041a1928dd2ea9b295864aad5920728f47ced7cc1b39cbb8cddcbf')
_distdir="Heap-Simple-XS-0.10"

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
