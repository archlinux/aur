# Maintainer:  Daniel Graña <dangra at gmail dot com>

pkgname=mkinitcpio-tailscale
pkgver=0.1
pkgrel=6
pkgdesc="Collection of mkinitcpio install hooks to integrate Tailscale into initramfs"
arch=("any")
url="https://github.com/dangra/mkinitcpio-tailscale"
license=("GPL-2.0-or-later")
depends=("mkinitcpio")
source=("sd-tailscale" "setup-initcpio-tailscale")
sha256sums=('c57ea49b3dd783b0b127e1e795edc048df4caa6928100f7f0483e8167ac3fb40'
            '2630df3dadb9679cf8f9c38f8974e9f3f5be6c9a5694963104386d652e03eea8')

package() {
  install -m 755 -D ${srcdir}/setup-initcpio-tailscale ${pkgdir}/usr/bin/setup-initcpio-tailscale
  install -m 644 -D ${srcdir}/sd-tailscale ${pkgdir}/usr/lib/initcpio/install/sd-tailscale
}
