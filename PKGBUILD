# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cpanplus-dist-build'
pkgver='0.80'
pkgrel='1'
pkgdesc="CPANPLUS plugin to install packages that use Build.PL"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpanplus>=0.84' 'perl-module-build>=0.32' 'perl')
makedepends=()
url='https://metacpan.org/release/CPANPLUS-Dist-Build'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/CPANPLUS-Dist-Build-0.80.tar.gz')
md5sums=('946eaf10c623956664d9f34b755f48fb')
sha512sums=('91808248f01b10c66df202ea94394ad945bf14c4911135e8601aad20b204ea86dbf619417e913164e41286c706f0c95f1f49a22b409c3873bcd9aeee4bf44d99')
_distdir="CPANPLUS-Dist-Build-0.80"

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
