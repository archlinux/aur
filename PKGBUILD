# Maintainer:  Daniel Graña <dangra at gmail dot com>

pkgname=mkinitcpio-tailscale
pkgver=1.3.0
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
            '073005500ecb2bc628b28dfeaa7c049e159716da8bb817e81622a31cd8b5a9cc'
            '63fd44cd09e73fbb35107328c3f0b69c9ffc9ea30083753b85c51f62261d9671')

package() {
  install -m 644 -D "${srcdir}/initcpio-hooks-tailscale" "${pkgdir}/usr/lib/initcpio/hooks/tailscale"
  install -m 644 -D "${srcdir}/initcpio-install-tailscale" "${pkgdir}/usr/lib/initcpio/install/tailscale"
  install -m 755 -D "${srcdir}/setup-initcpio-tailscale" "${pkgdir}/usr/bin/setup-initcpio-tailscale"
}
