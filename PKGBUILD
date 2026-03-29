# Maintainer: asyync1024 <asyync1024 at proton dot me>

pkgname=fastcompmgr
pkgver=0.6.1
pkgrel=1
pkgdesc="An early Compton-based compositor for X11 focused on performance."
arch=('x86_64')
url="https://github.com/tycho-kirchner/$pkgname"
license=('MIT')
depends=('glibc' 'libx11' 'libxcomposite' 'libxdamage' 'libxfixes' 'libxrender')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('2bdf3f47dd5abfdb83c8bdcf1a3ca49dea3248313ef780c76cf490a0a185d82cc7ac1f262978f0ba08510a022d2f382a41709c461909325101b1f3296091d9ad')

build() {
  cd "$pkgname-$pkgver"
  make -j$(nproc)
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
