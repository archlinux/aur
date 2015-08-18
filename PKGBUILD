# Maintainer: Slithery <aur at slithery dot uk>
# Contributor: Zack Buhman <zbuhman@linode.com>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>

pkgname=perl-webservice-linode
pkgver=0.28
pkgrel=1
pkgdesc="Perl Interface to the Linode.com API"
url="http://search.cpan.org/~mikegrb/WebService-Linode/"
license=('GPL1')
arch=('any')
depends=('perl-json' 'perl-lwp-protocol-https')
makedepends=('git' 'perl-module-build-tiny')
source=("$pkgname::git+https://github.com/mikegrb/WebService-Linode.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  perl Build.PL
  ./Build
}

package() {
  cd "$pkgname"
  ./Build install --destdir "$pkgdir" --installdirs vendor
}
