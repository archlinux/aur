# Maintainer:  Daniel Graña <dangra at gmail dot com>

pkgname=mkinitcpio-tailscale
pkgver=0.2
pkgrel=5
pkgdesc="mkinitcpio hook to launch Tailscale on systemd or busybox based initramfs"
arch=("any")
url="https://github.com/dangra/mkinitcpio-tailscale"
license=("GPL-2.0-or-later")
depends=("mkinitcpio")
source=("initcpio-hooks-tailscale"
        "initcpio-install-tailscale"
        "setup-initcpio-tailscale")
sha256sums=('5c341668e502c5e54e25b24607b1eb004a78d52332c48ccdfb07003f19f6fc8d'
            '60ebfa2d0a557d0b951a3a3cec01023acbb24feb55c986561e5c8e94bec1a77f'
            '480dec84c705dc437cb6fb1715031c1ea8e48c6b89cb0fd8c86a3af7169062f7')

package() {
  install -m 644 -D ${srcdir}/initcpio-hooks-tailscale ${pkgdir}/usr/lib/initcpio/hooks/tailscale
  install -m 644 -D ${srcdir}/initcpio-install-tailscale ${pkgdir}/usr/lib/initcpio/install/tailscale
  install -m 755 -D ${srcdir}/setup-initcpio-tailscale ${pkgdir}/usr/bin/setup-initcpio-tailscale
}
