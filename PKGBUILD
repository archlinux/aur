# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-proc-pid-file'
pkgver='1.27'
pkgrel='2'
pkgdesc="A module to manage PID files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Proc-PID-File'
source=('http://search.cpan.org/CPAN/authors/id/E/EC/ECALDER/Proc-PID-File-1.27.tar.gz')
md5sums=('3fcb07f914f863f9a0967b35af562f9f')
sha512sums=('05d5bcdcc6a9fb2d2cb3779fb6ad6469c7c7845147eae1a4a27dec5bf728ad4fde5c4e2d44bf91382e7609fd701a23dd6fe9edb798dbeecc012d240e25a79bb3')
_distdir="Proc-PID-File-1.27"

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
