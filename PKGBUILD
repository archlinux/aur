# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious-plugin-authentication'
pkgver='1.39'
pkgrel='1'
pkgdesc="A plugin to make authentication a bit easier"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=8.0' 'perl>=5.016')
makedepends=()
url='https://metacpan.org/release/Mojolicious-Plugin-Authentication'
source=("http://search.cpan.org/CPAN/authors/id/J/JJ/JJATRIA/Mojolicious-Plugin-Authentication-${pkgver}.tar.gz")
md5sums=('141dd090f6d8470a0d3483dc1f7aaa20')
sha512sums=('05b2f1a4dcbb32a2727a1ff37b78eb7882b8c4fae5753db6b016c2303794f33c36c78de60242b61bb89ae4d0c821ada6fe2538a20b073905d3b5d7bc5762fd1d')
_distdir="Mojolicious-Plugin-Authentication-${pkgver}"

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
