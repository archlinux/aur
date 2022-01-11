# Maintainer: Jesse Jaara <jesse.jaara@gmail.com>
# Contributor: Gionn <me[at]gionn[dot]net>

pkgname=upnp-router-control
pkgver=0.3.1
pkgrel=1
pkgdesc="UPnP Router Control allow to see some params of the router like the download speed and control port forwarding trough UPnP protocol."
url="https://launchpad.net/upnp-router-control"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('gtk3' 'gupnp')
makedepends=('intltool')
source=("http://launchpad.net/upnp-router-control/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('17028c2681a571b0998e2d81b12f2488')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
