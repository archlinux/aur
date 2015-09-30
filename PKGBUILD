# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-sub-exporter-formethods'
pkgver='0.100052'
pkgrel='1'
pkgdesc="helper routines for using Sub::Exporter to build methods"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-exporter>=0.978' 'perl-sub-name' 'perl-namespace-autoclean')
makedepends=()
url='https://metacpan.org/release/Sub-Exporter-ForMethods'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Sub-Exporter-ForMethods-0.100052.tar.gz')
md5sums=('2b0a23fd3fe6861959400bb4fc4d282f')
sha512sums=('75dc9d150f0d0fe33f727363582f99f1ca5c4b76e789e33e640f648588c23531516a99affd9097bc38e175e099dac817d307406dd2380f422aae401f3b5405ca')
_distdir="Sub-Exporter-ForMethods-0.100052"

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
