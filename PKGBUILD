# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=zulip-electron-bin
pkgver=0.5.10
pkgrel=4
pkgdesc="Desktop client for Zulip. Available for Mac, Linux and Windows."
arch=('x86_64')
url="https://github.com/zulip/zulip-electron"
license=('Apache')
source=("https://github.com/zulip/zulip-electron/releases/download/v${pkgver}/zulip-${pkgver}-linux.zip")
sha256sums=('35e1f7e27300acf52a4a604c71aa752e2d455ced35b695215e55bc70013bff11')

package() {
    install -d "$pkgdir"/opt
    cp -R "$srcdir"/linux-unpacked "$pkgdir"/opt/zulip-electron

    install -d "$pkgdir"/usr/bin
    ln -sf ../../opt/zulip-electron/zulip "$pkgdir"/usr/bin/zulip-electron

    # no man pages, docs or web assets in release tarball
}
