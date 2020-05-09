# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-role-commons'
pkgver='0.104'
pkgrel='1'
pkgdesc="roles that can be commonly used, for the mutual benefit of all"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-class-load' 'perl-moo' 'perl-object-id' 'perl-scalar-does>=0.006')
makedepends=()
url='http://search.cpan.org/dist/Role-Commons'
source=("https://cpan.metacpan.org/authors/id/T/TO/TOBYINK/Role-Commons-${pkgver}.tar.gz")
sha512sums=('83ee808cf6f387a64aeb3f08dc35f744308d619bffda9000e2a0abc98846f612c2b3e4c98128f9965b45097c724d88acf05bf60f227686512a7d8c28c0f82971')
_distdir="Role-Commons-${pkgver}"

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
