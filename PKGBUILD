# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-bootylicious'
pkgver='1.12'
pkgrel='1'
pkgdesc="Lightweight blog engine on Mojo steroids!"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojox-validator>=0.0016' 'perl-mojolicious>=5.81' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Bootylicious'
source=('http://search.cpan.org/CPAN/authors/id/O/OL/OLEG/Bootylicious-1.12.tar.gz')
md5sums=('ed17e03ae9111623bea1443e6ce555bb')
sha512sums=('574604ffb407a31c0b37f0a1da03f881214501e772cce5a00ea236644133d0dfa8ed7cb9150735c992dc9d1a905429a3faedfc083d92c60a9fef3007def8b1ad')
_distdir="Bootylicious-1.12"

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
