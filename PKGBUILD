# Maintainer: Lumina Nao <luminanao at duck.com>
# AUR AGENT: publish this file WHOLESALE (plus regenerated .SRCINFO).
# Do NOT bump pkgver in a stale AUR copy - that has shipped broken source
# refs, missing deps, and missing options three times. Verify after publish:
# llama-launcher/utils/check-aur-sync.sh must report OK for all packages.
pkgname=freeclaw
pkgver=11
pkgrel=1
pkgdesc="Community fork of OpenClaw with local inference improvements"
arch=(x86_64)
url="https://codeberg.org/LuminaNAO/freeclaw"
license=(MIT)
depends=(nodejs npm)
# node_modules ships ~2 GB with dozens of prebuilt .node/Go/Rust binaries;
# strip/debugedit over that tree takes many minutes and can corrupt prebuilt
# binaries. Nothing here benefits from stripping.
options=('!strip' '!debug')
source=(git+https://codeberg.org/LuminaNAO/freeclaw.git#tag="v${pkgver}")
sha256sums=(SKIP)

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" install
}
