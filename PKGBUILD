# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-time-duration-parse'
pkgver='0.12'
pkgrel='1'
pkgdesc="Parse string that represents time duration"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exporter-lite' 'perl-time-duration' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Time-Duration-Parse'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Time-Duration-Parse-0.12.tar.gz')
md5sums=('6c8d00201e54a23ad5f4a1d0847a9160')
sha512sums=('d8817dc3064faae2d745202a45c471829003f417ab3ac1369c413c83421c4d685c365e270c8897166a559eda463c3226b3e759c55843a2830509e71c4c2bff3f')
_distdir="Time-Duration-Parse-0.12"

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
