# Maintainer:  Daniel Graña <dangra at gmail dot com>

pkgname=mkinitcpio-tailscale
pkgver=1.4.0
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
            'a296d42fc7a0aa7f319880b8885b0519f96663f38338029fdc1d0f3c7d6cb359'
            '425e423d4cc590168f7e48c626264b2d02720eb29ebc446ddbac372ee2c1399e')

package() {
  install -m 644 -D "${srcdir}/initcpio-hooks-tailscale" "${pkgdir}/usr/lib/initcpio/hooks/tailscale"
  install -m 644 -D "${srcdir}/initcpio-install-tailscale" "${pkgdir}/usr/lib/initcpio/install/tailscale"
  install -m 755 -D "${srcdir}/setup-initcpio-tailscale" "${pkgdir}/usr/bin/setup-initcpio-tailscale"
}
