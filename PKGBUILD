# Maintainer: Slithery <aur at slithery dot uk>
# Contributor: Zack Buhman <zbuhman@linode.com>
# Contributor: Graham Edgecombe <graham@grahamedgecombe.com>

pkgname=linode-cli
pkgver=1.4.7
pkgrel=2
pkgdesc='A simple command-line interface to the Linode platform'
url='https://github.com/linode/cli'
license=('GPL2')
arch=('any')
depends=('perl-try-tiny' 'perl-libwww' 'perl-json' 'perl-crypt-ssleay'
         'perl-mozilla-ca' 'perl-webservice-linode')
install=linode-cli.install
source=("$url"/archive/v"$pkgver".zip)
sha256sums=('776a7df7eb4e595fb246b9482c3de2661ec7ff11b35156c870e78ca49ce38c07')

build() {
  cd "cli-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "cli-$pkgver"
  make install DESTDIR="$pkgdir"
}
