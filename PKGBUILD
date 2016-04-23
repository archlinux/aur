# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-router-simple'
pkgver='0.17'
pkgrel='1'
pkgdesc="simple HTTP router"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor-lite' 'perl')
makedepends=()
url='https://metacpan.org/release/Router-Simple'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOKUHIROM/Router-Simple-0.17.tar.gz')
md5sums=('96473bf45f61ed8e241e0410d4039b44')
sha512sums=('4fbc4fb375d873d7c06d18da49855b81336744bc712035c6557914e275099d93aee4ab787bb1e7b3b730a109b716b4f572fc538d1d574ff709968a1b3767a963')
_distdir="Router-Simple-0.17"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
