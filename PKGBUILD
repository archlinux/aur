# Maintainer:  Daniel Graña <dangra at gmail dot com>
#
# This is a template, not a finished package definition. pkgver, pkgrel and
# sha256sums are placeholders filled in at release time by scripts/aur-stage.sh
# from the git tag being published; .SRCINFO is generated there too and is not
# tracked in this repo. Build with `make build` (which stages first) rather than
# running makepkg here, or you will get a package labelled 0.0.0.

pkgname=mkinitcpio-tailscale
pkgver=1.2.0
pkgrel=1
pkgdesc="mkinitcpio hook to launch Tailscale on systemd or busybox based initramfs"
arch=("any")
url="https://github.com/dangra/mkinitcpio-tailscale"
license=("GPL-2.0-or-later")
depends=("mkinitcpio")
source=("initcpio-hooks-tailscale"
  "initcpio-install-tailscale"
  "setup-initcpio-tailscale")
sha256sums=('fc322878c59232bd92043b9aa3827cee40704937d9ecf0ebe1a66174f990cb3e'
            '2e63c9a69ec45322f2166a23f73b2bc79cb269c7526b1e2729c84917e72f3206'
            '63fd44cd09e73fbb35107328c3f0b69c9ffc9ea30083753b85c51f62261d9671')

package() {
  install -m 644 -D "${srcdir}/initcpio-hooks-tailscale" "${pkgdir}/usr/lib/initcpio/hooks/tailscale"
  install -m 644 -D "${srcdir}/initcpio-install-tailscale" "${pkgdir}/usr/lib/initcpio/install/tailscale"
  install -m 755 -D "${srcdir}/setup-initcpio-tailscale" "${pkgdir}/usr/bin/setup-initcpio-tailscale"
}
