# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Michael Manley <mmanley@nasutek.com>

pkgname=chan-sccp
pkgver=4.3.2_zeta
pkgrel=1
pkgdesc='Cisco SCCP channel driver for Asterisk, alternative to chan_skinny'
arch=('x86_64' 'i686')
url='http://chan-sccp-b.sourceforge.net'
license=('GPL')
depends=('asterisk' 'zlib')
backup=('etc/asterisk/sccp.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chan-sccp/chan-sccp/archive/v${pkgver/_/-}.tar.gz")
sha256sums=('38c7cd27dba771c54842348bf11c9e97353d392c3a0f008fd6f5eafe7f35958d')

build() {
  cd "$pkgname-${pkgver/_/-}"
  ./configure --prefix=/usr
  make
}

package(){
  cd "$pkgname-${pkgver/_/-}"
  make DESTDIR="$pkgdir" install
}

