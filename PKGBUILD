# Maintainer: Florian Knodt <arch[at]adlerweb[dot]info>
pkgname=apache-mod_proxy_msrpc
pkgver=r41.9065a97
pkgrel=1
pkgdesc="Apache module for Outlook Anywhere support in reverse proxy setups"
url="https://github.com/bombadil/mod_proxy_msrpc"
arch=('x86_64' 'i686')
license=('apache')
depends=('apache')
makedepends=('check')
conflicts=()
replaces=()
backup=()
source=("git://github.com/bombadil/mod_proxy_msrpc")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${pkgname}
  ./configure
  make
}

package() {
  cd ${pkgname}/src/.libs/
  install -Dm755 mod_proxy_msrpc.so "$pkgdir/usr/lib/httpd/modules/mod_proxy_msrpc.so"
}

# vim:set ts=2 sw=2 et:
