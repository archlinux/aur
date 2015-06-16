# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-io-aio'
pkgver='4.31'
pkgrel='1'
pkgdesc="Asynchronous Input/Output"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.20' 'perl-common-sense')
makedepends=()
url='http://search.mcpan.org/dist/IO-AIO'
source=('http://search.mcpan.org/CPAN/authors/id/M/ML/MLEHMANN/IO-AIO-4.31.tar.gz')
md5sums=('de33075400968c2c23a861d05f92a979')
sha512sums=('f1e564595201ba46506d9aea4f8e54d8aae55b8b018ad8fddcd3eeba3b3a5f6814df21f5dee68a3a30cee7509de22a4440afcec73d6df15d20f44ef5e5496a27')
_distdir="IO-AIO-4.31"

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
