# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-action-renderview'
pkgver='0.16'
pkgrel='1'
pkgdesc="Sensible default end action."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=5.80030' 'perl-data-visitor>=0.24' 'perl-mro-compat')
makedepends=('perl-http-request-ascgi')
url='http://search.cpan.org/dist/Catalyst-Action-RenderView'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Catalyst-Action-RenderView-0.16.tar.gz')
md5sums=('ed0ce5d8e57fef806938bf904862a2cd')
sha512sums=('eae4fbad6a023a2364de254162e50fddd9fa17f28ba8a5c3fb0f34173d9e18c1189081d76e5d61519d1d398210a4f49b87c6eea11c85cc828f33da4940d5b288')
_distdir="Catalyst-Action-RenderView-0.16"

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
