# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-moosex-role-parameterized'
pkgver='1.02'
pkgrel='1'
pkgdesc="roles with composition parameters"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=('perl-moose' 'perl-test-fatal')
url='http://search.cpan.org/dist/MooseX-Role-Parameterized'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SARTAK/MooseX-Role-Parameterized-1.02.tar.gz')
md5sums=('97a45b34081c3b5f611409aec49d77f4')
sha512sums=('be500c7ac002346f25694d548212e6be59bfd6d783b82fe86babe377f821b809888a7003ccda31a345d4961eac3b83619a56a08f4f612e8b22209b76d2bb8fc3')
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
