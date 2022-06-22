# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-git'
pkgver='2.048'
pkgrel='1'
pkgdesc="Update your git repository after release"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-meta-check' 'perl-datetime' 'perl-dist-zilla' 'perl-dist-zilla-plugin-config-git' 'perl-file-copy-recursive' 'perl-file-which' 'perl-file-chdir' 'perl-file-pushd' 'perl-git-wrapper' 'perl-ipc-system-simple' 'perl-log-dispatchouli' 'perl-module-runtime' 'perl-moose' 'perl-moosex-has-sugar' 'perl-path-tiny' 'perl-string-formatter' 'perl-try-tiny' 'perl-type-tiny' 'perl-types-path-tiny' 'perl-version-next' 'perl-namespace-autoclean' 'perl')
checkdepends=('perl-dist-zilla' 'perl-test-fatal')
url='https://metacpan.org/release/Dist-Zilla-Plugin-Git'
source=(https://cpan.metacpan.org/authors/id/E/ET/ETHER/Dist-Zilla-Plugin-Git-$pkgver.tar.gz)
sha256sums=('2e218df3db6ef154a86bbc2d735b6435e2252fdf0a289b5a8a87614104a890b4')
_distdir="Dist-Zilla-Plugin-Git-$pkgver"

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
