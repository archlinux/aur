# Maintainer: robertfoster

pkgname=netsukuku
pkgver=1.0.1
pkgrel=2
pkgdesc="an experimental peer-to-peer routing system"
arch=('i686' 'x86_64')
url="http://netsukuku.freaknet.org"
license=('GPL')
depends=(libgee vala tasklet zcd netsukuku-rpc andns-rpc ntkresolv)

source=("http://download.savannah.gnu.org/releases/netsukuku//${pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --enable-logtasklet \
    --sysconfdir=/etc \
    --prefix=/usr \
    --sbindir=/usr/bin
  CFLAGS="-Wc90-c99-compat -std=gnu89" \
    make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('09be67aaba6b9936113a3b47f43b83d824174dfe935217937300f6847a5b7b74')
