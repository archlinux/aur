# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-moox-types-mooselike'
pkgver='0.27'
pkgrel='1'
pkgdesc="some Moosish types and a type builder"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-runtime>=0.012' 'perl-moo>=0.09101')
makedepends=()
checkdepends=('perl-test-fatal>=0.003')
url='http://search.mcpan.org/dist/MooX-Types-MooseLike'
source=('http://search.mcpan.org/CPAN/authors/id/M/MA/MATEU/MooX-Types-MooseLike-0.27.tar.gz')
md5sums=('049e99292aa848454ae1e42b09603fa9')
sha512sums=('bfd221e2dd6b2f292b87b6bb3062fc00fa1f90426961c1c6de0dc266e0745e6ec3a3a9443aec006d8e999912c03f24a0735d01a3a4228803b556e14b608f2153')
_distdir="MooX-Types-MooseLike-0.27"

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
