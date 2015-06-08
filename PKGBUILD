# CPAN Name  : Data-UUID
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-data-uuid'
pkgver='1.220'
pkgrel='1'
pkgdesc="Globally/Universally Unique Identifiers (GUIDs/UUIDs)"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Data-UUID'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Data-UUID-1.220.tar.gz')
md5sums=('3db849cb2ebedd969cb0090d91e39712')
sha512sums=('6d4508cd37f06c549276c1021781a5cf81cb823eaad0152447e9515b9ecf4fb8c6d1c5bfe44eda3296adde6a50d5f6c435269eb5db6207f669d1e12b68fdf657')
_distdir="Data-UUID-1.220"

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
