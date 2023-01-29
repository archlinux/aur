# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-locale-xgettext'
pkgver='0.7'
pkgrel='1'
pkgdesc="Extract Strings To PO Files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-locale-po>=0.27' 'perl-module-build>=0.28' 'perl-libintl-perl>=0' 'perl>=5.008')
makedepends=()
url='https://metacpan.org/release/Locale-XGettext'
source=('http://search.cpan.org/CPAN/authors/id/G/GU/GUIDO/Locale-XGettext-0.7.tar.gz')
md5sums=('1575b5a9a7333bdbc4c525173e2f340e')
sha512sums=('d9121783e378f640d0826196cb7ed864581391f0f0ea3ab49ff528c5b6b84a089de40a15ca6cfab89d77b4478611d62b0e510802212e83a84c8eded0119c383b')
_distdir="Locale-XGettext-0.7"

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
