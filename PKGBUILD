# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=zulip-electron-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Desktop client for Zulip. Available for Mac, Linux and Windows."
arch=('x86_64')
url="https://github.com/zulip/zulip-electron"
license=('Apache')
source=("https://github.com/zulip/zulip-electron/releases/download/v${pkgver}/zulip-${pkgver}-linux.zip")
sha256sums=('5bbd3d082e07412c935ac8a16bcf1fa85c228caabb6f510852fb41e999b148f0')

package() {
    install -d "$pkgdir"/opt
    cp -R "$srcdir"/linux-unpacked "$pkgdir"/opt/zulip-electron

    install -d "$pkgdir"/usr/bin
    ln -sf ../../opt/zulip-electron/zulip "$pkgdir"/usr/bin/zulip-electron

    # no man pages, docs or web assets in release tarball
}
