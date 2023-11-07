# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-ppix-editortools'
pkgver='0.21'
pkgrel='1'
pkgdesc="Utility methods and base class for manipulating Perl via PPI"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-xsaccessor>=1.02' 'perl-ppi>=1.203' 'perl-try-tiny>=0' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-differences>=0' 'perl-test-exception>=0' 'perl-test-most>=0')
url='https://metacpan.org/release/PPIx-EditorTools'
source=('http://search.cpan.org/CPAN/authors/id/Y/YA/YANICK/PPIx-EditorTools-0.21.tar.gz')
md5sums=('b3f5de664e2926c796e0ad34cb0fa1be')
sha512sums=('16fd1b4144742debd6dce3f49215d3b24b896688f5f2150492c9e1ae0cb37a14a18f444b39d8cdf42c1895fff8b3123ed181582264df061a3acbb47ae90e5085')
_distdir="PPIx-EditorTools-0.21"

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
