# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-bdb'
pkgver='1.91'
pkgrel='1'
pkgdesc="Asynchronous Berkeley DB access"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('db>=5.3.28' 'glibc>=2.20' 'perl-common-sense')
makedepends=()
url='http://search.mcpan.org/dist/BDB'
source=('http://search.mcpan.org/CPAN/authors/id/M/ML/MLEHMANN/BDB-1.91.tar.gz')
md5sums=('b337bb3a52d911b9024b0587b2589dcb')
sha512sums=('ebd0c2609e56e3b7ed3932bc48bbfc88fda4c5751fab7ee406ef0b659f1e6d43b636e312136b0447b9d70928d5d5ef881af0115f12a32b394e2d6ea7525db903')
_distdir="BDB-1.91"

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
