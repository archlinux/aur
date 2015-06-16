# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-git-repository'
pkgver='1.313'
pkgrel='1'
pkgdesc="Perl interface to Git repositories"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-system-command>=1.103' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Git-Repository'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOOK/Git-Repository-1.313.tar.gz')
md5sums=('34f14e6bbfd860d72bb9463a7da9b192')
sha512sums=('82f9135fc9bc871c3d2f1ea0fd6336b60cbe81509148e4925592858f1e6960e91fea3284260314e578890ee9b6c15d65db19582019f283a6343c1d1b8525f14c')
_distdir="Git-Repository-1.313"

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
