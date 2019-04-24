# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-kit'
pkgver='2.15'
pkgrel='1'
pkgdesc="Build custom test packages with only the features you want"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-hook-lexwrap>=0' 'perl-import-into>=0' 'perl-module-runtime>=0' 'perl-sub-delete>=0' 'perl-test-exception>=0' 'perl-test-nowarnings>=0' 'perl-test-output>=0' 'perl-test-pod>=0' 'perl-test-warn>=0' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Test-Kit'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAORU/Test-Kit-2.15.tar.gz')
md5sums=('12f326522549597442149669a315716b')
sha512sums=('ef798307e44c214f3b312b1bde3b48a39948c72c683a17b0e0ab7b097cbc991408a6382d06a94bbfa8cd0e6d92a4ba5339245463c249660f987dd8a5aef4691e')
_distdir="Test-Kit-2.15"

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
