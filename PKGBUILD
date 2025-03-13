# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-tree-simple'
pkgver='1.34'
pkgrel='2'
pkgdesc="A simple tree object"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-test-exception>=0.15')
url='https://metacpan.org/release/Tree-Simple'
source=("http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/Tree-Simple-${pkgver}.tgz")
md5sums=('b425592c0ddb0fc1883c6b6b7338e623')
sha512sums=('cd03bdfd283d55a097bceb0c9bf3b81bb4dd5ca9a60de59e3e70b7e88b672456fd18d370f2dee1077a2afeecc973d42e78cc31f8023344b1f7e211432ef4e3ed')
_distdir="Tree-Simple-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
