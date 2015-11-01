# Submitter  : gergan_penkov
# Maintainer : gergan_penkov
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-fatal-exception'
pkgver='0.05'
pkgrel='1'
pkgdesc="Succeed or throw exception"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exception-base>=0.21' 'perl-exception-died>=0' 'perl>=5.006')
makedepends=('perl-exception-warning>=0')
checkdepends=('perl-test-assert>=0' 'perl-test-unit-lite>=0.07')
url='https://metacpan.org/release/Fatal-Exception'
source=('http://search.cpan.org/CPAN/authors/id/D/DE/DEXTER/Fatal-Exception-0.05.tar.gz')
md5sums=('ce5c89540d2029cb2de2444a296a5f6d')
sha512sums=('9ea0574aee37bcead291abe5a70cd65b48cdd07526279a4f87915b136de522c5b27a3dd8c2539531cf97e418ddc8cfff649c6d284246ae32bc8fc827d447a447')
_distdir="Fatal-Exception-0.05"

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
