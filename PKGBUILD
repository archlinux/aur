# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-image-objectdetect'
pkgver='0.12'
pkgrel='1'
pkgdesc="detects objects from picture(using opencv)"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('opencv>=2.4.6' 'perl')
makedepends=()
url='http://search.cpan.org/dist/Image-ObjectDetect'
source=('http://search.cpan.org/CPAN/authors/id/J/JI/JIRO/Image-ObjectDetect-0.12.tar.gz')
md5sums=('ac18f31a5e67da2b32c3df66d8f71133')
sha512sums=('b029467463fade1e5a0d585082629d539d28bb0509b7b5a5fa5b68dc0551c29137d8b8109f74292e5a18562595bce74424e2bb302375416fc54a3a32bb92bea1')
_distdir="Image-ObjectDetect-0.12"

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
