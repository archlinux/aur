# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-model-menugrinder'
pkgver='0.06'
pkgrel='1'
pkgdesc="A Catalyst model base-class for using WWW::MenuGrinder"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime' 'perl-moose' 'perl-scope-guard' 'perl-www-menugrinder>=0.04')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-Model-MenuGrinder'
source=('http://search.cpan.org/CPAN/authors/id/A/AR/ARODLAND/Catalyst-Model-MenuGrinder-0.06.tar.gz')
md5sums=('0f6055e3f0c04c4df1af70bc7738b1d4')
sha512sums=('b94f5b59a9143c07b005aef888a41b7de5869c5b9e1c589c4088b3b59bda1a9a361197b61f6491416390555353b5b8fbf7c5c2d55b2b5ffb02c6ec375475a9a7')
_distdir="Catalyst-Model-MenuGrinder-0.06"

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
