# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30
# Maintainer: Aaron Bishop <erroneous@gmail.com>

pkgname='perl-rest-client'
pkgver='281'
pkgrel='1'
pkgdesc="A simple client for interacting with RESTful http/https resources"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-lwp-protocol-https' 'perl-uri' 'perl-libwww' 'perl>=5.8.0')
url='https://metacpan.org/release/REST-Client'
_distdir="REST-Client-${pkgver}"
source=("https://cpan.metacpan.org/authors/id/A/AK/AKHUETTEL/${_distdir}.tar.gz")
sha512sums=('de40602e3a4428ee2fd8705c4544214a8c062f813e6050c315877e497ed68a458561b9b234f633529de01ab24080cd5ee4719b8ab275b4e4595274d2ba1194b7')

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
