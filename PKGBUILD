# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-methodattributes'
pkgver='0.32'
pkgrel='5'
pkgdesc="Code attribute introspection"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-moose>=0' 'perl-moosex-role-parameterized>=0' 'perl-namespace-autoclean>=0.08' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-fatal>=0' 'perl-test-needs>=0')
url='https://metacpan.org/release/MooseX-MethodAttributes'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-MethodAttributes-$pkgver.tar.gz")
md5sums=('f18009f821e62b3fd9c2605820a0e61b')
sha512sums=('83989095a0b179ae8ceeb38673a60e8e15904c10ddfafd8b07631de9584ff4feec99d0da3b4111408a677659c71fc58dd17cb3dc99d23ed9f4f2289755b0e5cc')
_distdir="MooseX-MethodAttributes-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
