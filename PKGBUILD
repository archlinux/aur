# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.21

pkgname='perl-object-authority'
pkgver='0.004'
pkgrel='1'
pkgdesc="adds an AUTHORITY method to your class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-object-role')
makedepends=('perl-test-exception')
url='http://search.cpan.org/dist/Object-AUTHORITY'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/Object-AUTHORITY-0.004.tar.gz')
md5sums=('fd19081a1a332ebba84b54fb3a218f3b')
sha512sums=('2037f0d607ebbb30ba581a504f31265e0b4f7d249352187e89ba5a52f05767268f0cc80691f0c925c074360549d1d97490c7684ab38a4b990ddf0a0072bfdcfa')
_distdir="${srcdir}/Object-AUTHORITY-0.004"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
