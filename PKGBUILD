# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-yaml-libyaml'
pkgver='0.62'
pkgrel='1'
pkgdesc="Perl YAML Serialization using XS and libyaml"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/YAML-LibYAML'
source=('http://search.cpan.org/CPAN/authors/id/T/TI/TINITA/YAML-LibYAML-0.62.tar.gz')
md5sums=('e8e0ba8c9f589c809ee04bb526ae03d7')
sha512sums=('05d2fa1e656034da0c903a267037a08855040843dc6ec68d91e99df5c64f6896d29be0d170b5c08c0d601a1c87b595c90786a7ff1a12a33fa2bfff21f86aec81')
_distdir="YAML-LibYAML-0.62"

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
