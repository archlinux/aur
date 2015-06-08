# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-datetime-format-human-duration'
pkgver='0.61'
pkgrel='1'
pkgdesc="Get a locale specific string describing the span of a given duration"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/DateTime-Format-Human-Duration'
source=('http://search.cpan.org/CPAN/authors/id/M/MS/MSTRAT/DateTime-Format-Human-Duration-0.61.tar.gz')
md5sums=('8d633456e864859b55dda0445ce48041')
sha512sums=('ce7e8cdfc5eca42b3e1fb6d1888f5afa12fbc5cd8f75c767a872cd66deb4b638d910cbf058439889ea7b090176a0c2b4e8407b278d3194767aeb97c2638494e6')
_distdir="DateTime-Format-Human-Duration-0.61"

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
