# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-poe-component-pluggable'
pkgver='1.26'
pkgrel='2'
pkgdesc="A base class for creating plugin-enabled POE Components."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-poe>=1.004' 'perl-task-weaken' 'perl>=5.6.0')
makedepends=()
url='https://metacpan.org/release/POE-Component-Pluggable'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/POE-Component-Pluggable-1.26.tar.gz')
md5sums=('989a64c6c2939a19ee5844c9d9e87047')
sha512sums=('745549971e059b192e1dd35afc1ea7a40355c6a182bd65e06527d42283d914da06026e85b3ad2e24a40dac96b60ed10ace40b5e52049abdfa0caaac4e31f9892')
_distdir="POE-Component-Pluggable-1.26"

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
