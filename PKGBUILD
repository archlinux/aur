# Maintainer:  Daniel Graña <dangra at gmail dot com>

pkgname=mkinitcpio-tailscale
pkgver=0.3
pkgrel=1
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
            'fa0bec1288bb190389fc9fad26d0a3a366b3933be27e0957fa9d5d8f12b94253')

package() {
  install -m 644 -D ${srcdir}/initcpio-hooks-tailscale ${pkgdir}/usr/lib/initcpio/hooks/tailscale
  install -m 644 -D ${srcdir}/initcpio-install-tailscale ${pkgdir}/usr/lib/initcpio/install/tailscale
  install -m 755 -D ${srcdir}/setup-initcpio-tailscale ${pkgdir}/usr/bin/setup-initcpio-tailscale
}
