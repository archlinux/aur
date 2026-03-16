# Maintainer: asyync1024 <asyync1024 at proton dot me>

pkgname=fastcompmgr
pkgver=0.5
pkgrel=8
pkgdesc="An early Compton-based compositor for X11 focused on performance."
arch=('x86_64')
url="https://github.com/tycho-kirchner/$pkgname"
license=('MIT')
makedepends=('git')
depends=('glibc' 'libx11' 'libxcomposite' 'libxdamage' 'libxfixes' 'libxrender')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('46819f4511ad5deec386fc1bb022482ac7175aa91cc633017d92304e764fc4f4560c09e548875d8c85bdc2487a7048665d4bf98d46fcbf1d848d8d3ef2ec075f')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
