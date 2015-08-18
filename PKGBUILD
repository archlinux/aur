# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-path-isdev'
pkgver='1.001002'
pkgrel='1'
pkgdesc="Determine if a given Path resembles a development source tree"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-tiny>=0.010' 'perl-file-homedir' 'perl-module-runtime' 'perl-path-tiny>=0.004' 'perl-role-tiny' 'perl-sub-exporter')
makedepends=()
checkdepends=('perl-test-fatal')
url='https://metacpan.org/release/Path-IsDev'
source=('http://search.cpan.org/CPAN/authors/id/K/KE/KENTNL/Path-IsDev-1.001002.tar.gz')
md5sums=('8907c626bb16558151f7dc11f1c47719')
sha512sums=('fb9c24ad02899c501001615c315a62b620e243f2ad8c17acebce5571b0918a18c61549bd637c6d68ec2ebc9e739921c8168d99ef84bc8373f6c3c8726ac84125')
_distdir="Path-IsDev-1.001002"

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
