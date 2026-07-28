# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: VisorCraft LLC <maintainer@visorcraft.com>
# SPDX-FileCopyrightText: 2026 VisorCraft LLC
# SPDX-License-Identifier: GPL-3.0-only
# Modified for a proper AUR release

pkgname=grexa-bin
pkgver=1.11.2
pkgrel=1
pkgdesc="Fast Linux file content search with tabs, replace, and AI assistance"
arch=('x86_64')
url="https://github.com/visorcraft/Grexa"
license=('GPL-3.0-only')
provides=('grexa-cli' 'grexa')
conflicts=('grexa')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/grexa-$pkgver-linux-x86_64.tar.gz")
sha256sums=('0a065036d717e7321bc07cf5df69f2245e880829eb88e58f761599dae0ced797')

package() {
    depends=(
        'qt6-base'
        'qt6-declarative'
        'kirigami'
        'hicolor-icon-theme'
        'poppler'
    )
    optdepends=(
        'podman: container search via rootless Podman'
        'docker: container search via Docker'
        'kwalletmanager: API key storage (KDE)'
        'gnome-keyring: API key storage (non-KDE)'
    )

    cd "grexa-$pkgver-linux-x86_64"
    mkdir -p "$pkgdir/usr"
    cp -a --parents bin share -t "$pkgdir/usr/"
}
