# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=zulip-electron-bin
pkgver=2.3.3
pkgrel=1
pkgdesc="Desktop client for Zulip. Available for Mac, Linux and Windows."
arch=('x86_64')
url="https://github.com/zulip/zulip-electron"
license=('Apache')
source=("https://github.com/zulip/zulip-electron/releases/download/v${pkgver}/Zulip-${pkgver}-linux-x64.zip")
sha512sums=('6fe23e0253b5096f1509df5beb95de592bc23c42fd629f67f323f3f7561d0cccba051a23f0df6211cfb448663e2132677d4e47d903fa84dba2fc71b9a6ea648c')

conflicts=('zulip-desktop')

package() {
    install -d "$pkgdir"/opt
    cp -R "$srcdir" "$pkgdir"/opt/zulip-electron

    install -d "$pkgdir"/usr/bin
    ln -sf /opt/zulip-electron/zulip "$pkgdir"/usr/bin/zulip

    # no man pages, docs or web assets in release tarball
}
