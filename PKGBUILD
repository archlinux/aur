# Contributor: dax <dax@deelab.org>
pkgname=gkrellmapcupsd
pkgver=0.02
pkgrel=3
pkgdesc="Gkrellm apcupsd monitor. Monitors line voltage, charge, time left, load. Works fine if you do not change the config. Otherwise, gkrellm will crash."
arch=('i686' 'x86_64')
url="http://www.unixdev.net/projects/gkrellmapcupsd"
license=('GPL')
depends=('gkrellm')
source=("ftp://ftp.unixdev.net/pub/unixdev/gkrellmapcupsd/0.02/${pkgname}_${pkgver}.tar.gz")
md5sums=('37179b274e07c0b7c308392f9f8524ad')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 gkrellmapcupsd.so "$pkgdir/usr/lib/gkrellm2/plugins/gkrellmapcupsd.so"
}
