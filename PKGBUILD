# Maintainer: Ivy Foster <code@escondida.tk>
# Reference: PKGBUILD(5)

pkgname=physlock
pkgver=11
pkgrel=3
pkgdesc='Lightweight Linux console locking tool'
url='https://github.com/muennich/physlock'
license=(GPL2)

depends=(pam)
optdepends=('xss-lock: lock screen on suspend or after inactivity')

arch=(x86_64)
source=("physlock-$pkgver.tar.gz::https://github.com/muennich/physlock/archive/v$pkgver.tar.gz")
# sha256sums provided by packager; grains of salt advised
sha256sums=(f03031a6f4c6a08d62098457834d04b8835082a76609059451397356a83d4442)

build() {
	make PREFIX=/usr -C "physlock-$pkgver"
}

package() {
	make PREFIX=/usr "DESTDIR=$pkgdir" -C "physlock-$pkgver" install
}
