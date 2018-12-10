# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=zulip-electron-bin
pkgver=2.3.82
pkgrel=2
pkgdesc="Desktop client for Zulip. Available for Mac, Linux and Windows."
arch=('x86_64')
url="https://github.com/zulip/zulip-electron"
license=('Apache')
source=("https://github.com/zulip/zulip-electron/releases/download/v${pkgver}/Zulip-${pkgver}-linux-x64.zip")
sha512sums=('ffcfba431aad0e576b7025e1175f1dd4a87950e181357ff31c7ab2d31c249e12a9e9df313a9ba39c17c009e349950a3a943c760732e7c60877721a28674c6237')

conflicts=('zulip-desktop')
depends=('gconf')

package() {
    install -d "$pkgdir"/opt
    cp -R "$srcdir" "$pkgdir"/opt/zulip-electron

    install -d "$pkgdir"/usr/bin
    ln -sf /opt/zulip-electron/zulip "$pkgdir"/usr/bin/zulip

    # no man pages, docs or web assets in release tarball
}
