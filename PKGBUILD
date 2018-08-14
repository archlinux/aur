# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=zulip-electron-bin
pkgver=2.3.5
pkgrel=1
pkgdesc="Desktop client for Zulip. Available for Mac, Linux and Windows."
arch=('x86_64')
url="https://github.com/zulip/zulip-electron"
license=('Apache')
source=("https://github.com/zulip/zulip-electron/releases/download/v${pkgver}/Zulip-${pkgver}-linux-x64.zip")
sha512sums=('bb6ed71612b0de45cebd9330371717e4d05ac3c4e534efc3f92893e8c57c1db1afe8e61173f2b8288d177e827566fde47899e8e1a4f438631b7719fac56c8217')

conflicts=('zulip-desktop')

package() {
    install -d "$pkgdir"/opt
    cp -R "$srcdir" "$pkgdir"/opt/zulip-electron

    install -d "$pkgdir"/usr/bin
    ln -sf /opt/zulip-electron/zulip "$pkgdir"/usr/bin/zulip

    # no man pages, docs or web assets in release tarball
}
