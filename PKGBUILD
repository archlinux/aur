# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-devel-declare'
pkgver='0.006018'
pkgrel='1'
pkgdesc="Adding keywords to perl, in perl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-hooks-endofscope>=0.05' 'perl-b-hooks-op-check>=0.19' 'perl-sub-name' 'perl')
makedepends=()
checkdepends=('perl-test-requires')
url='https://metacpan.org/release/Devel-Declare'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Devel-Declare-0.006018.tar.gz')
md5sums=('2ff00f8c7c81848695c94c01b5e7bbb8')
sha512sums=('0d85d8f00c566aac63a86a4b8990aad1b1267bfd7cfe7304c106e26d066d75c74b54a7ca6998dcd2fd6a05cf6e9388355baa2a24f520156e1b2a132def823bf1')
_distdir="Devel-Declare-0.006018"

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
