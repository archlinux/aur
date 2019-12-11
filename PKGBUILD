# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious-plugin-authentication'
pkgver='1.33'
pkgrel='1'
pkgdesc="A plugin to make authentication a bit easier"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=0' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Mojolicious-Plugin-Authentication'
source=("http://search.cpan.org/CPAN/authors/id/J/JJ/JJATRIA/Mojolicious-Plugin-Authentication-${pkgver}.tar.gz")
md5sums=('b318be1e1e50e7595baee639b2964565')
sha512sums=('1bade03f350054ea760fab413432764ebc1f3555a858f2f6b806bb31ae1b660f09c84a9b22fc2b3fb4fab26767d6313c418b9695fabd8088514d2a30bc4e33df')
_distdir="Mojolicious-Plugin-Authentication-${pkgver}"

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
