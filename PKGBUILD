# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-role-hasmessage
pkgver=0.007
pkgrel=1
pkgdesc="A thing with a message method"
arch=('any')
url="https://metacpan.org/dist/Role-HasMessage"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-moose' 'perl-moosex-role-parameterized' 'perl-string-errf'
         'perl-try-tiny' 'perl-namespace-clean')
source=("https://www.cpan.org/authors/id/R/RJ/RJBS/Role-HasMessage-${pkgver}.tar.gz")
sha512sums=('855f3ca7f60eb956c6fc9dfe5b7f91af86ed66602f65eff1f14dcc66c453a8582e2339d53832f8595f39935ef40f7c8806f4bd74d4a0a8ed576a0402737d901e')

build() {
  cd "${srcdir}/Role-HasMessage-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Role-HasMessage-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Role-HasMessage-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
