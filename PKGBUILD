# Maintainer:  Courtney Swagar <distorto@member.fsf.org>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious'
pkgver='9.41'
pkgrel='1'
pkgdesc="Real-time web framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.16.0')
makedepends=()
optdepends=('perl-cpanel-json-xs>=4.09: Faster JSON encoding and decoding' 'perl-role-tiny>=2.000001: Role support')
url='https://metacpan.org/release/Mojolicious'
source=("https://cpan.metacpan.org/authors/id/S/SR/SRI/Mojolicious-${pkgver}.tar.gz")
md5sums=('b0bd3782883651ba94caf832af93480e')
sha512sums=('0a7a75f6e798753486a2ca98bff5d7c0b472d6957f2602d33ccbe6e49e9097359bf41c4bb057a467d421c3b5b926e6d448444875e48ec629e2df2ddc85a22d5b')
_distdir="Mojolicious-${pkgver}"

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
