# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-moosex-blessed-reconstruct'
pkgver='0.04'
pkgrel='1'
pkgdesc="A Data::Visitor for creating Moose objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-visitor>=0.21' 'perl-moose>=1.05' 'perl-namespace-clean')
makedepends=('perl-test-use-ok')
url='http://search.cpan.org/dist/MooseX-Blessed-Reconstruct'
source=('http://search.cpan.org/CPAN/authors/id/N/NU/NUFFIN/MooseX-Blessed-Reconstruct-0.04.tar.gz')
md5sums=('c0ea62668eb2e6cb558a98a561ce066d')
sha512sums=('1640a8b4488680b39a2dff4eba41f7c363520d48f0df2c38fb502bd18ad6a81e4641357c3de9f881b90dd3370a10af8c0752004ee23c44c0b26a04445a7e2475')
_distdir="MooseX-Blessed-Reconstruct-0.04"

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
