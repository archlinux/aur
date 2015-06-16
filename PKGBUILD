# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-gnupg'
pkgver='0.19'
pkgrel='1'
pkgdesc="Perl module interface to the GNU Privacy Guard (v1.x.x series) Note: Tests fail if GnuPG is not correctly setup. See comments inside PKGBUILD if you have it set up correctly."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'gnupg')
makedepends=()
url='http://search.mcpan.org/dist/GnuPG'
source=('http://search.mcpan.org/CPAN/authors/id/Y/YA/YANICK/GnuPG-0.19.tar.gz')
md5sums=('e2fe3780e399a350151139707c45e91b')
sha512sums=('c1a425ebc4981b84fb75e5293068a163b9173245e8fd6307dc1e084b995bc1e273bbfe18f252f3353e89947f4e84220402103da9ed92e90292ec7e72a3975b85')
_distdir="GnuPG-0.19"

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

# make test requires gnupg setup correctly on your system
# uncomment lines 36-38 if you have done so.
check() {
  cd "$srcdir/$_distdir"
#  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
#    make test
#  )
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
