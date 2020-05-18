# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Michael Manley <mmanley@nasutek.com>

pkgname=chan-sccp
pkgver=4.3.2_epsilon
pkgrel=1
pkgdesc='Cisco SCCP channel driver for Asterisk, alternative to chan_skinny'
arch=('x86_64' 'i686')
url='http://chan-sccp-b.sourceforge.net'
license=('GPL')
depends=('asterisk' 'zlib')
backup=('etc/asterisk/sccp.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chan-sccp/chan-sccp/archive/v${pkgver/_/-}.tar.gz")
sha256sums=('9a3cc7ac5b6e917c6a6b326212b0d144ae0042dae07bb85cb0e719944e1ee572')

build() {
  cd "$pkgname-${pkgver/_/-}"
  ./configure --prefix=/usr
  make
}

package(){
  cd "$pkgname-${pkgver/_/-}"
  make DESTDIR="$pkgdir" install
}

