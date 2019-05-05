# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-github-uploadrelease'
pkgver='0.002'
pkgrel='1'
pkgdesc="Upload the package to GitHub after release"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=0' 'perl-dist-zilla-plugin-git>=0' 'perl-dist-zilla-plugin-github>=0' 'perl-file-slurp>=0' 'perl-git-wrapper>=0' 'perl-json>=0' 'perl-moose>=0' 'perl-try-tiny>=0' 'perl>=5.010')
makedepends=('perl-module-build>=0.28')
url='https://metacpan.org/release/Dist-Zilla-Plugin-GitHub-UploadRelease'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZU/ZURBORG/Dist-Zilla-Plugin-GitHub-UploadRelease-0.002.tar.gz')
md5sums=('7d4623ddccf143e76a97974a02ff2363')
sha512sums=('95b49e48b9a2c87f43c396a53e3b848143bc9e25011bd7617a3c4869da0f57cd4c2668c980e9c7e7488a47211b62f9a4099e13d6d02c40619de6bc5a5479c4d0')
_distdir="Dist-Zilla-Plugin-GitHub-UploadRelease-0.002"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
