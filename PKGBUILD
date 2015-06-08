# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lingua-en-titlecase-simple'
pkgver='0.1'
pkgrel='1'
pkgdesc="Automatically title-case headlines and title-texts."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Lingua-EN-Titlecase-Simple'
source=('http://search.cpan.org/CPAN/authors/id/I/ID/IDOPEREL/Lingua-EN-Titlecase-Simple-0.1.tar.gz')
md5sums=('958d7d1f959df41e3a067031a7b75dd2')
sha512sums=('8bc4172d3d63bfd46a9976727a8df4308589ae07f28409599fab253eb03e9dedc1e267f85a2004ce7243b2521fff92083b4ad38322eb3f4bb5e0fbec33ffc583')
_distdir="Lingua-EN-Titlecase-Simple-0.1"

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
