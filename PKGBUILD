# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-role-hasmessage'
pkgver='0.006'
pkgrel='1'
pkgdesc="a thing with a message method"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose' 'perl-moosex-role-parameterized' 'perl-string-errf' 'perl-try-tiny' 'perl-namespace-clean')
makedepends=()
url='https://metacpan.org/release/Role-HasMessage'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Role-HasMessage-0.006.tar.gz')
md5sums=('42834b39e9da34e5498ab8e8c2ee0a02')
sha512sums=('2bb8b19fe2c113c0c92a5e16180f53879ad92fbcb63a5b3af4ead167a4c8b3dcd460c9307d3c8e24ab5070e6c58f378d9e6854ed82da0ea231e456d5786b5398')
_distdir="Role-HasMessage-0.006"

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
