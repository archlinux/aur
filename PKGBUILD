# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-catalyst-controller-actionrole'
pkgver='0.16'
pkgrel='1'
pkgdesc="Apply roles to action instances (DEPRECATED)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-action-rest>=0.74' 'perl-catalyst-runtime' 'perl-class-load' 'perl-moose' 'perl-moosex-types' 'perl-string-rewriteprefix>=0.004' 'perl-namespace-clean')
makedepends=()
url='http://search.mcpan.org/dist/Catalyst-Controller-ActionRole'
source=('http://search.mcpan.org/CPAN/authors/id/E/ET/ETHER/Catalyst-Controller-ActionRole-0.16.tar.gz')
md5sums=('d0b64f0a3720c9a738181c917f7bcc20')
sha512sums=('270cc17e62a25e5c0ca0100a7f986610d7a452e95f571821f57adedf72681220b80e1278ed0978989cf2387b259ac790450142e8e6d2afacc0cf409cebf9f7b5')
_distdir="Catalyst-Controller-ActionRole-0.16"

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
