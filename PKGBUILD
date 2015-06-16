# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-crypt-rc4'
pkgver='2.02'
pkgrel='1'
pkgdesc="Perl implementation of the RC4 encryption algorithm"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Crypt-RC4'
source=('http://search.mcpan.org/CPAN/authors/id/S/SI/SIFUKURT/Crypt-RC4-2.02.tar.gz')
md5sums=('4ca59a7e58ac9597c3b4f3f46ea22629')
sha512sums=('201f8eaa4b40689029524e28452565dd6245e5d49f1e38984a2008501754a76da15241fdfcd79ecc7134e50e39c3d085ac0fc6250ee8fefb79bf806c55b4848b')
_distdir="Crypt-RC4-2.02"

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
