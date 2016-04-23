# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-types-set-object'
pkgver='0.05'
pkgrel='1'
pkgdesc="Set::Object type with coercions and stuff."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.50' 'perl-moosex-types' 'perl-set-object' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-fatal')
url='https://metacpan.org/release/MooseX-Types-Set-Object'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Types-Set-Object-0.05.tar.gz')
md5sums=('b3aaddf0fed676ad219b1de4518806c6')
sha512sums=('f61d186b5eac3aa37acad7828dee38c5e9b043a084c94e7aca4df242c5febfd28c7061bc241a76bfed83b3c36bb2d4510e5e774480e28ea182009f9581dcbfce')
_distdir="MooseX-Types-Set-Object-0.05"

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
