# Maintainer: David Anderson <dave@natulte.net>

pkgname="tailscale-unstable-bin"
_version="0.96-16"
pkgver="0.96_16"
pkgrel="2"
pkgdesc="A mesh VPN that makes it easy to connect your devices, wherever they are."
arch=("x86_64")
url="https://tailscale.com"
license=("MIT")
depends=("glibc")
backup=("etc/default/tailscaled")
source=("$pkgname-$pkgver.tgz::https://pkgs.tailscale.com/unstable/tailscale_${_version}_amd64.tgz")
sha256sums=('4c5c2e691430f0193a318aef33e95bbc2714f61580c40b48a15afe4acc1bb79c')
install="tailscale.install"

package() {
    cd tailscale_${_version}_amd64
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/etc/default" "$pkgdir/usr/lib/systemd/system"
  install -m755 tailscale tailscaled "$pkgdir/usr/bin"
  install -m644 systemd/tailscaled.defaults "$pkgdir/etc/default/tailscaled"
  install -m644 systemd/tailscaled.service "$pkgdir/usr/lib/systemd/system"
}
