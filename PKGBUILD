# Maintainer:  Daniel Graña <dangra at gmail dot com>

pkgname=mkinitcpio-tailscale
pkgver=0.4
pkgrel=1
pkgdesc="mkinitcpio hook to launch Tailscale on systemd or busybox based initramfs"
arch=("any")
url="https://github.com/dangra/mkinitcpio-tailscale"
license=("GPL-2.0-or-later")
depends=("mkinitcpio")
source=("initcpio-hooks-tailscale"
        "initcpio-install-tailscale"
        "setup-initcpio-tailscale")
sha256sums=('55177e12c2292665ca86a9235d17e61f7ad080d2ed236e7de60be048116d2f15'
            '60ebfa2d0a557d0b951a3a3cec01023acbb24feb55c986561e5c8e94bec1a77f'
            'e6cf49ea9ac359d21665444c2a3ab009aedb52d215e47287ecff7d6d4159d4c2')

package() {
  install -m 644 -D ${srcdir}/initcpio-hooks-tailscale ${pkgdir}/usr/lib/initcpio/hooks/tailscale
  install -m 644 -D ${srcdir}/initcpio-install-tailscale ${pkgdir}/usr/lib/initcpio/install/tailscale
  install -m 755 -D ${srcdir}/setup-initcpio-tailscale ${pkgdir}/usr/bin/setup-initcpio-tailscale
}
