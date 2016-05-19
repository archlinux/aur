# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-www-aur'
pkgver='0.22'
pkgrel='1'
pkgdesc="API for the Archlinux User Repository website."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-cookies' 'perl-json' 'perl-lwp-protocol-https>=6' 'perl-uri' 'perl-libwww')
makedepends=()
url='https://metacpan.org/release/WWW-AUR'
source=('http://search.cpan.org/CPAN/authors/id/J/JN/JNBEK/WWW-AUR-0.22.tar.gz')
md5sums=('bdf6345d72b13b3656e6026dda30d77f')
sha512sums=('ec6db8cfd9bd76d1e38ff73dc7fa7b078468f43e9cddedd0b83909011d3fb52da5013a55899c1e2b05f284a0036ebb1d811c3f33c9bd0ed292a5941d2854706b')
_distdir="WWW-AUR-0.22"

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
