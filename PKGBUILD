# Maintainer: András Wacha < awacha at gmail >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-starlink-ast'
pkgver='3.02'
pkgrel='2'
pkgdesc="Interface to the Starlink AST library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-pgplot' 'perl-tk' 'perl-tk-zinc')
makedepends=('perl-module-build')
checkdepends=('perl-test-deep>=0' 'perl-test-number-delta>=0')
url='https://metacpan.org/release/Starlink-AST'
source=("http://search.cpan.org/CPAN/authors/id/G/GS/GSB/Starlink-AST-${pkgver}.tar.gz")
md5sums=('f8fa07d0e92b984578fda0d95faaa0ff')
sha512sums=('4fcba8772fe35d83803ca262f885f032efa025d2bfa3950faae1b675496cfff724b0b17ded16314006bf57f582db90353cccf09f7c2e412f4ef3f64aabdb3f59')
_distdir="Starlink-AST-${pkgver}"



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
    unset DISPLAY
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
