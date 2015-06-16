# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-cookie-baker'
pkgver='0.05'
pkgrel='1'
pkgdesc="Cookie string generator / parser"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-uri' 'perl')
makedepends=()
checkdepends=('perl-test-time')
url='https://metacpan.org/release/Cookie-Baker'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/Cookie-Baker-0.05.tar.gz')
md5sums=('69ae3400d69762ea0e2de8a1ee2769af')
sha512sums=('110d05e5c884b11cefefd8c241e7f62d4aeef8dd48b639f65e7363b7fb660b6e143f49b6318c8c377ee74c4520d26e6abbd30bee0c3e373f095bd979b8bbe133')
_distdir="Cookie-Baker-0.05"

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
