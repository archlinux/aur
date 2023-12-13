# Maintainer:  Daniel Graña <dangra at gmail dot com>

pkgname=mkinitcpio-tailscale
pkgver=0.2
pkgrel=2
pkgdesc="Collection of mkinitcpio install hooks to integrate Tailscale into initramfs"
arch=("any")
url="https://github.com/dangra/mkinitcpio-tailscale"
license=("GPL-2.0-or-later")
depends=("mkinitcpio")
source=("tailscale_hook"
        "tailscale_install"
        "setup-initcpio-tailscale")
sha256sums=('bbee1d1f599ea3e64a17aa57704fa46a3b681bca6c9c12e2bf4751696a89eefc'
            'c1103a919a98c14f3c1492088b8cac7e711f8c99631a3859afe7eca0959911ef'
            '480dec84c705dc437cb6fb1715031c1ea8e48c6b89cb0fd8c86a3af7169062f7')

package() {
  install -m 644 -D ${srcdir}/tailscale_hook ${pkgdir}/usr/lib/initcpio/hooks/tailscale
  install -m 644 -D ${srcdir}/tailscale_install ${pkgdir}/usr/lib/initcpio/install/tailscale
  install -m 755 -D ${srcdir}/setup-initcpio-tailscale ${pkgdir}/usr/bin/setup-initcpio-tailscale
}
