# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-salvation'
pkgver='0.9913'
pkgrel='1'
pkgdesc="Simple and free architectural solution for huge applications"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-assert>=0.2' 'perl-io-string>=1.08' 'perl-moose>=2.0402' 'perl-xml-writer>=0.615' 'perl')
makedepends=()
url='http://search.mcpan.org/dist/Salvation'
source=('http://search.cpan.org/CPAN/authors/id/G/GF/GFILATOV/Salvation-0.9913.tar.gz')
md5sums=('472a54064b11acb49d6c953a43b3bbcc')
sha512sums=('dde71445390ee110d99d92c9e355f20c581fe0b917b5017cee1c209a39c48039e21e97b1cede47e378f47f1f3a54e68846cb36275488a49e28c511c43c2ff6e4')
_distdir="Salvation-0.9913"

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
