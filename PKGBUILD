# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-devel-cover'
pkgver='1.15'
pkgrel='1'
pkgdesc="Code coverage metrics for Perl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
checkdepends=('perl-test-warn')
url='http://search.mcpan.org/dist/Devel-Cover'
source=('http://search.mcpan.org/CPAN/authors/id/P/PJ/PJCJ/Devel-Cover-1.15.tar.gz')
md5sums=('1bfab447ec62d49a095fc8878c5ed54b')
sha512sums=('8c12bc81eaa183a14d29b3e9eb0cdea31cff80d45e9447962c185a9ed364a5ffe6f755e472974c0d2b754a17dad724688b769546687bab0dc4893e44d7c19eb9')
_distdir="Devel-Cover-1.15"

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
