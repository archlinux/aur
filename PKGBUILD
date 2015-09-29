# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-pod-eventual'
pkgver='0.094001'
pkgrel='1'
pkgdesc="read a POD document as a series of trivial events"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mixin-linewise')
makedepends=()
checkdepends=('perl-test-deep' 'perl-perlio-utf8-strict')
url='https://metacpan.org/release/Pod-Eventual'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Pod-Eventual-0.094001.tar.gz')
md5sums=('627de0dc05c84f147643d51dc132015a')
sha512sums=('f892653f6895381b3f493b44e8c295d02bf78e70e64c23b9c8602e6692517790524cd5996bb6d84aed7b4e8da60eebe99330a53e5f26f75e4ab017d6e8d317e6')
_distdir="Pod-Eventual-0.094001"

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
