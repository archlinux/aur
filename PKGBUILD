# Maintainer:  Daniel Graña <dangra at gmail dot com>

pkgname=mkinitcpio-tailscale
pkgver=1.4.3
pkgrel=1
pkgdesc="mkinitcpio hook to launch Tailscale on systemd or busybox based initramfs"
arch=("any")
url="https://github.com/dangra/mkinitcpio-tailscale"
license=("GPL-2.0-or-later")
depends=("mkinitcpio")
source=("initcpio-hooks-tailscale"
  "initcpio-install-tailscale"
  "setup-initcpio-tailscale")
sha256sums=('b2652386f393f8689eaf06f16ddb4a89e766771e13ffd697a7231d74f226692e'
            '5d0b435001c31fa3b9ddd3f54e0c295895c1aac5b89a7c9f128201f750c8b40f'
            '384da262a6ff288ec115a3593fe10a696289c143dd55054e5c246dbda9be0e2a')

package() {
  install -m 644 -D "${srcdir}/initcpio-hooks-tailscale" "${pkgdir}/usr/lib/initcpio/hooks/tailscale"
  install -m 644 -D "${srcdir}/initcpio-install-tailscale" "${pkgdir}/usr/lib/initcpio/install/tailscale"
  install -m 755 -D "${srcdir}/setup-initcpio-tailscale" "${pkgdir}/usr/bin/setup-initcpio-tailscale"
}
