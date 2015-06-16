# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-file-copy-link'
pkgver='0.140'
pkgrel='1'
pkgdesc="extension for replacing a link by a copy of the linked file"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/File-Copy-Link'
source=('http://search.mcpan.org/CPAN/authors/id/R/RM/RMBARKER/File-Copy-Link-0.140.tar.gz')
md5sums=('2aa840e10db02072dbaa7dc9616be8cb')
sha512sums=('d937d8353c4be3070591c7e28ea177e587326936cea6d84d895d0fd951e663e506c5680f0d8acad756972db7c70147b31078a2e2595bcab4bb56879b97f3c8b1')
_distdir="File-Copy-Link-0.140"

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
