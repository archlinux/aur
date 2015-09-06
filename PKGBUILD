# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-moosex-role-parameterized'
pkgver='1.08'
pkgrel='1'
pkgdesc="roles with composition parameters"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=('perl-moose' 'perl-test-fatal')
url='http://search.cpan.org/dist/MooseX-Role-Parameterized'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Role-Parameterized-1.08.tar.gz')
md5sums=('e89538edd84513c090914c7c1fa7e321')
sha512sums=('2ee0a9c98090a2e82f360eb1276114bca243ec7676899830d06416cb378745d38ede5021eeb788b6c3499ba12969138dffadbbce34fe391778469ef3c5f4afdd')
_distdir="MooseX-Role-Parameterized-${pkgver}"

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
