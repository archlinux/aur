# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-bootylicious'
pkgver='1.10'
pkgrel='1'
pkgdesc="Lightweight blog engine on Mojo steroids!"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojox-validator>=0.0016' 'perl-mojolicious>=5.81')
makedepends=()
url='https://metacpan.org/release/Bootylicious'
source=('http://search.cpan.org/CPAN/authors/id/O/OL/OLEG/Bootylicious-1.10.tar.gz')
md5sums=('129f40fe934e87d69801b04ff731e11a')
sha512sums=('1c3daf1e590553c5d74ee7c17f0bfbdc9f64b58bbb746a523226256bb1fa644e471933540d168e81b5567af89fce02a919a0c08de56aac944a157f3b9b1aab7e')
_distdir="Bootylicious-1.10"

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
