# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-www-aur'
pkgver='0.19'
pkgrel='1'
pkgdesc="API for the Archlinux User Repository website."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-cookies' 'perl-json' 'perl-lwp-protocol-https>=6' 'perl-uri' 'perl-libwww')
makedepends=()
url='https://metacpan.org/release/WWW-AUR'
source=('http://search.cpan.org/CPAN/authors/id/J/JU/JUSTER/WWW-AUR-0.19.tar.gz')
md5sums=('0d7b378481e0eb28918d24419aeaa485')
sha512sums=('50f3fd25413a88ec094f730f489a8f7b879bbc2ea49b3d39d83c52b5aaf2771300ae50eb40123112a2bd9a3fd867a57f304eab1f042391170fe92d281cb80f0c')
_distdir="WWW-AUR-0.19"

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
