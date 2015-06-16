# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cpanplus-dist-fedora'
pkgver='0.0.4'
pkgrel='1'
pkgdesc="a cpanplus backend to build Fedora/RedHat rpms"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-pod-pom' 'perl-template-toolkit')
makedepends=()
url='http://search.cpan.org/dist/CPANPLUS-Dist-Fedora'
source=('http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/CPANPLUS-Dist-Fedora-v0.0.4.tar.gz')
md5sums=('136e117c8e73bf445dc7b94fd1d3370a')
sha512sums=('126c2dcc3e4981048cf49db6fbbb4d748dc1b2b049ce4c37e983a65248e8307c54601a59eeb926c351cd7f4f048783848ca86cf754b1f3218224b2ce16d183b2')
_distdir="CPANPLUS-Dist-Fedora-v0.0.4"

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
