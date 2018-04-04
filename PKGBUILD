# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=zulip-electron-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="Desktop client for Zulip. Available for Mac, Linux and Windows."
arch=('x86_64')
url="https://github.com/zulip/zulip-electron"
license=('Apache')
source=("https://github.com/zulip/zulip-electron/releases/download/v${pkgver}/zulip-${pkgver}-linux.zip")
sha256sums=('fd14836eadce75a615a8d315704afb6020afa4ef28d24f278a4c008098e684d1')

package() {
    install -d "$pkgdir"/opt
    cp -R "$srcdir"/linux-unpacked "$pkgdir"/opt/zulip-electron

    install -d "$pkgdir"/usr/bin
    ln -sf ../../opt/zulip-electron/zulip "$pkgdir"/usr/bin/zulip-electron

    # no man pages, docs or web assets in release tarball
}
