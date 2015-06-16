# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-file-find-rule'
pkgver='0.33'
pkgrel='3'
pkgdesc="Alternative interface to File::Find"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-number-compare' 'perl-text-glob>=0.07')
makedepends=()
url='http://search.mcpan.org/dist/File-Find-Rule'
source=('http://search.mcpan.org/CPAN/authors/id/R/RC/RCLAMP/File-Find-Rule-0.33.tar.gz')
md5sums=('92c6cb88549c30f5665e39bf80f3d704')
sha512sums=('287537a39e4ceeef6388dcf27c6b10fd7aceae7ab55b27f6acd608687ae695f964703e5b2ea2efbb57f7e5a6b658d7637fef5e87695fe39ae3222f8c7808ff31')
_distdir="File-Find-Rule-0.33"

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
