# Maintainer:  Daniel Graña <dangra at gmail dot com>

pkgname=mkinitcpio-tailscale
pkgver=0.2
pkgrel=1
pkgdesc="Collection of mkinitcpio install hooks to integrate Tailscale into initramfs"
arch=("any")
url="https://github.com/dangra/mkinitcpio-tailscale"
license=("GPL-2.0-or-later")
depends=("mkinitcpio")
source=("sd-tailscale"
        "tailscale_hook"
        "tailscale_install"
        "setup-initcpio-tailscale")
sha256sums=('c57ea49b3dd783b0b127e1e795edc048df4caa6928100f7f0483e8167ac3fb40'
            'd9c513e6b8eea84cbce8ca9c36edcf245e6a46ac29bdbf73e1b9001062dafdbd'
            '50333551578d53f0f43b2a3e4a9e1ed390f9217f844dcef4a353c3cce9763c86'
            '480dec84c705dc437cb6fb1715031c1ea8e48c6b89cb0fd8c86a3af7169062f7')

package() {
  install -m 755 -D ${srcdir}/setup-initcpio-tailscale ${pkgdir}/usr/bin/setup-initcpio-tailscale
  install -m 644 -D ${srcdir}/sd-tailscale ${pkgdir}/usr/lib/initcpio/install/sd-tailscale
  install -m 644 -D ${srcdir}/tailscale_install ${pkgdir}/usr/lib/initcpio/install/tailscale
  install -m 644 -D ${srcdir}/tailscale_hook ${pkgdir}/usr/lib/initcpio/hooks/tailscale
}
