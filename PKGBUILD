# Submitter  : gergan_penkov
# Maintainer : gergan_penkov
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-mock-class'
pkgver='0.0303'
pkgrel='1'
pkgdesc="Simulating other classes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exception-base>=0' 'perl-fatal-exception>=0' 'perl-moose>=0' 'perl-test-assert>=0.05' 'perl-namespace-clean>=0' 'perl>=5.006')
makedepends=('perl-class-inspector>=0' 'perl-test-unit-lite>=0.12')
url='https://metacpan.org/release/Test-Mock-Class'
source=('http://search.cpan.org/CPAN/authors/id/D/DE/DEXTER/Test-Mock-Class-0.0303.tar.gz')
md5sums=('ae6c3b7f9d426a6420451a5c012f9161')
sha512sums=('591d9a9e5144279ebb67cdd3978f629d74acd06a8711b5b99ee7d29b24175a97f8108d63f4fd40fbc8fa431ed0e8a4a52252bfd80ef1f3b4905b4a9d28fdea52')
_distdir="Test-Mock-Class-0.0303"

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
