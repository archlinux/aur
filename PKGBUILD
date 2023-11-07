# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-locale-xgettext'
pkgver='0.8'
pkgrel='1'
pkgdesc="Extract Strings To PO Files"
arch=('any')
license=('LGPL3')
options=('!emptydirs')
depends=('perl-locale-po>=0.27' 'perl-module-build>=0.28' 'perl-libintl-perl>=0' 'perl>=5.008')
makedepends=()
url='https://metacpan.org/release/Locale-XGettext'
source=('http://search.cpan.org/CPAN/authors/id/G/GU/GUIDO/Locale-XGettext-0.8.tar.gz')
md5sums=('8d868096adda12aa9b2a76ab78f83351')
sha512sums=('beb4e671f11400cf61da023b234e1d10fbb79ded86c722062da404fa29979b21258934608b93abd156a54120908385d3fe67cbc7da55a0fd605ab18794622a6f')
_distdir="Locale-XGettext-0.8"

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
