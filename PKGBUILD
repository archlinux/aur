# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-text-format'
pkgver='0.63'
pkgrel='1'
pkgdesc="Various subroutines to format text."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0.28' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Text-Format'
source=('http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Text-Format-0.63.tar.gz')
md5sums=('4c925a8f93c2a8209e9120a9198d769f')
sha512sums=('d8a19b2d58bcf86b39236b949d14e7ac7a8130a5f4b7ca28dc847f8e50520d8e86c9e11450ee7753fc156555c528cce3f8d825ad1313d7a58d0a12a37fa81320')
_distdir="Text-Format-0.63"

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
