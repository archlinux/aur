# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=zulip-electron-bin
pkgver=2.3.8
pkgrel=1
pkgdesc="Desktop client for Zulip. Available for Mac, Linux and Windows."
arch=('x86_64')
url="https://github.com/zulip/zulip-electron"
license=('Apache')
source=("https://github.com/zulip/zulip-electron/releases/download/v${pkgver}/Zulip-${pkgver}-linux-x64.zip")
sha512sums=('6caeba482b92d3a498e979830729ec7236f4e1fa44b8c2f7ec4d14c7a49879dad16f0b63146f5b761fc260f9d83982f86446faab6b9c34105a2245f67a176dd9')

conflicts=('zulip-desktop')

package() {
    install -d "$pkgdir"/opt
    cp -R "$srcdir" "$pkgdir"/opt/zulip-electron

    install -d "$pkgdir"/usr/bin
    ln -sf /opt/zulip-electron/zulip "$pkgdir"/usr/bin/zulip

    # no man pages, docs or web assets in release tarball
}
