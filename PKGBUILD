# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-time-duration-parse'
pkgver='0.13'
pkgrel='1'
pkgdesc="Parse string that represents time duration"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exporter-lite' 'perl-time-duration' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Time-Duration-Parse'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Time-Duration-Parse-0.13.tar.gz')
md5sums=('c9ac2f37ed8bf96c4c9c59fe181643ee')
sha512sums=('2732f6053dbc672d92a4efddab6e767f81bf1386f7b232fe1d1debe551d406b27c222c2173f9771f302bb928dac96edeb1ef3dfd0fe67d46315f671c7ad1a5b4')
_distdir="Time-Duration-Parse-0.13"

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
