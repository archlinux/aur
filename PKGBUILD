# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cache-ref'
pkgver='0.04'
pkgrel='1'
pkgdesc="Memory only cache of live references"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-hash-util-fieldhash-compat' 'perl-moose' 'perl-moosex-role-parameterized' 'perl-namespace-autoclean')
makedepends=()
url='https://metacpan.org/release/Cache-Ref'
source=('http://search.cpan.org/CPAN/authors/id/B/BR/BRUNOV/Cache-Ref-0.04.tar.gz')
md5sums=('6c656fbcc09e909e292b2ce13ce55349')
sha512sums=('474f3f2468c5a4260f56c21c0d469a25f453a7b639ce8c0bc28187160a5b701ca6fdc4287e36c5cad6d4292e6e28cf7a38ab8b3a6cee626d26e692ae7837fa1a')
_distdir="Cache-Ref-0.04"

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
