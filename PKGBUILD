# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-config-mvp'
pkgver='2.200010'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load>=0.17' 'perl-module-pluggable' 'perl-moose>=0.91' 'perl-moosex-oneargnew' 'perl-params-util' 'perl-role-hasmessage' 'perl-role-identifiable' 'perl-throwable' 'perl-tie-ixhash' 'perl-try-tiny')
makedepends=()
checkdepends=('perl-test-fatal')
url='https://metacpan.org/release/Config-MVP'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Config-MVP-2.200010.tar.gz')
md5sums=('4f487a935fb973323288bcea4bec34f8')
sha512sums=('b0febad2c80ab3e9d8c19b2a8b6c8a6bdb1e2358fa7a3c436e639d75ad15560ac4aa08f88c67f32f28dd9fe491ae7b156715e93d0078d27cee20e16016154052')
_distdir="Config-MVP-2.200010"

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
