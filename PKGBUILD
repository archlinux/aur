# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-config-git'
pkgver='0.92'
pkgrel='1'
pkgdesc="Plugin configuration containing settings for a Git repo"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=0' 'perl-moose>=0.34' 'perl-moosex-types>=0.06' 'perl-string-errf>=0.001' 'perl-namespace-clean>=0.06')
makedepends=()
checkdepends=('perl-test-checkdeps>=0.010')
url='https://metacpan.org/release/Dist-Zilla-Plugin-Config-Git'
source=('http://search.cpan.org/CPAN/authors/id/B/BB/BBYRD/Dist-Zilla-Plugin-Config-Git-0.92.tar.gz')
md5sums=('f8a4b2013eb31cbed150bc8850d9b13a')
sha512sums=('f319cbebe197a1c3c6f1ce19435f4e7a93378f211051b94b8bb0d3ce94da209c3d72ff5f3f7084222fd22c785bc75ac2ebcb4c7f0600ee87cec54f3454cc0fe9')
_distdir="Dist-Zilla-Plugin-Config-Git-0.92"

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
