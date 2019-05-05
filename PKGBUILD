# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-git'
pkgver='2.046'
pkgrel='1'
pkgdesc="Update your git repository after release"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-meta-check>=0.011' 'perl-datetime>=0' 'perl-dist-zilla>=4' 'perl-dist-zilla-plugin-config-git>=0' 'perl-file-copy-recursive>=0' 'perl-file-which>=0' 'perl-file-chdir>=0' 'perl-file-pushd>=0' 'perl-git-wrapper>=0.021' 'perl-ipc-system-simple>=0' 'perl-log-dispatchouli>=0' 'perl-module-runtime>=0' 'perl-moose>=0' 'perl-moosex-has-sugar>=0' 'perl-path-tiny>=0.048' 'perl-string-formatter>=0' 'perl-try-tiny>=0' 'perl-type-tiny>=0' 'perl-types-path-tiny>=0' 'perl-version-next>=0' 'perl-namespace-autoclean>=0.09' 'perl>=5.010')
makedepends=()
checkdepends=('perl-dist-zilla>=0' 'perl-test-fatal>=0')
url='https://metacpan.org/release/Dist-Zilla-Plugin-Git'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Dist-Zilla-Plugin-Git-2.046.tar.gz')
md5sums=('3dfe55ff3f7f7ba6c1f061697d90b1a7')
sha512sums=('ac94d73c19f4f4ef9736a58cca439cc5fa64ee0c91869b2fc8be205134258c49e8164e8b67eb1d2e9e34fe6ad1f377ecacd5721d79f6d22f258ab1b275cbe92e')
_distdir="Dist-Zilla-Plugin-Git-2.046"

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
