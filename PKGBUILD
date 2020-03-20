# Maintainer: David Anderson <dave@natulte.net>

pkgname="tailscale-unstable-bin"
_version="0.97-36"
pkgver="0.97_36"
pkgrel="1"
pkgdesc="A mesh VPN that makes it easy to connect your devices, wherever they are."
arch=("x86_64")
url="https://tailscale.com"
license=("MIT")
depends=("glibc")
backup=("etc/default/tailscaled")
source=("$pkgname-$pkgver.tgz::https://pkgs.tailscale.com/unstable/tailscale_${_version}_amd64.tgz")
sha256sums=('585e5ddb7deb1b1b5364ca135b0909372f3ccfda0293958d24e7194d1de6642e')
install="tailscale.install"

package() {
    cd tailscale_${_version}_amd64
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/etc/default" "$pkgdir/usr/lib/systemd/system"
  install -m755 tailscale tailscaled "$pkgdir/usr/bin"
  install -m644 systemd/tailscaled.defaults "$pkgdir/etc/default/tailscaled"
  install -m644 systemd/tailscaled.service "$pkgdir/usr/lib/systemd/system"
}
