# Contributor: Archer777 <NAME at gmx dot com>

_realname=Perl-MinimumVersion-Fast
pkgname=perl-minimumversion-fast
pkgver=0.17
pkgrel=1
pkgdesc="Find a minimum required version of perl for Perl code"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.5' 'perl-compiler-lexer>=0.11')
makedepends=('perl-module-build' 'perl-module-build-xsutil')
url='http://search.cpan.org/dist/Perl-MinimumVersion-Fast'
source=("https://cpan.metacpan.org/authors/id/T/TO/TOKUHIROM/${_realname}-${pkgver}.tar.gz")
md5sums=('f0f5e86e8e1c1000bfdd740c2919535c')

build() {
  cd ${_realname}-${pkgver}
  perl Build.PL --installdirs=vendor
  ./Build
}

check() {
  cd ${_realname}-${pkgver}
  ./Build test
}

package() {
  cd ${_realname}-${pkgver}
  ./Build install --destdir="${pkgdir}"
}
