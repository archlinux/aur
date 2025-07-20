# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-any-moose'
pkgver='0.27'
pkgrel='2'
pkgdesc="(DEPRECATED) use Moo instead!"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-moose>=0' 'perl>=5.6.2')
makedepends=()
url='https://metacpan.org/release/Any-Moose'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Any-Moose-$pkgver.tar.gz")
md5sums=('8c5d318ee105c3a556019da537df542f')
sha512sums=('5c97caf2e64462bae95fc4d5dd41868c01f856bd8f74872985254b7cc6ce0e13b4accad7955047ff5c4013399f7aea2ad6d48ae3592883a3b6cd20c0e4478b7b')
_distdir="Any-Moose-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
