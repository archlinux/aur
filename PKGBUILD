# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-class-multimethods'
pkgver='1.701'
pkgrel='1'
pkgdesc="Support multimethods and function overloading in Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Class-Multimethods'
source=("https://cpan.metacpan.org/authors/id/D/DC/DCONWAY/Class-Multimethods-$pkgver.tar.gz")
md5sums=('84a93a1e59b64f6c90b68903c1bc0f94')
sha512sums=('3a39d4bd8c16eb16317219dae4be62bbef6352bf9a0497e89da07ff784631ecaace0602c1d2bb5308bf339e5dd60ad64f3418c7b2ddadf8b71072eb040f494e1')
_distdir="Class-Multimethods-1.700"

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
