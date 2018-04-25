# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=zulip-electron-bin
pkgver=1.9.0
pkgrel=2
pkgdesc="Desktop client for Zulip. Available for Mac, Linux and Windows."
arch=('x86_64')
url="https://github.com/zulip/zulip-electron"
license=('Apache')
source=("https://github.com/zulip/zulip-electron/releases/download/v${pkgver}/zulip-${pkgver}-linux.zip")
sha512sums=('329dae5abdacebdc483e55654008b4408e494fabe8d338b03e281540681cdf8ea414c9b203b948805b4a06b348580586fce2b41ec85e845ea807a21218450362')

conflicts=('zulip-desktop')

package() {
    install -d "$pkgdir"/opt
    cp -R "$srcdir" "$pkgdir"/opt/zulip-electron

    install -d "$pkgdir"/usr/bin
    ln -sf "$pkgdir"/opt/zulip-electron/zulip "$pkgdir"/usr/bin/zulip

    # no man pages, docs or web assets in release tarball
}
