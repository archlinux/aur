# Maintainer: Slithery <aur at slithery dot uk>
# Contributor: Zack Buhman <zbuhman@linode.com>
# Contributor: Graham Edgecombe <graham@grahamedgecombe.com>

pkgname=linode-cli
pkgver=1.4.7
pkgrel=1
pkgdesc='A simple command-line interface to the Linode platform'
url='https://github.com/linode/cli'
license=('GPL2')
arch=('any')
depends=('perl-try-tiny' 'perl-libwww' 'perl-json' 'perl-crypt-ssleay'
         'perl-mozilla-ca' 'perl-webservice-linode')
makedepends=('git')
source=("$pkgname::git+https://github.com/linode/cli.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$pkgname"
  make install DESTDIR="$pkgdir"
}
