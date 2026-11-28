# Maintainer: VisorCraft LLC <packages@visorcraft.com>
# SPDX-FileCopyrightText: 2026 VisorCraft LLC
# SPDX-License-Identifier: 0BSD

pkgname=caishen-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Local-first, always-encrypted household financial ledger"
arch=('x86_64')
url="https://github.com/visorcraft/CaiShen"
license=('GPL-3.0-only')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libgcc'
    'libsoup3'
    'wayland'
    'webkit2gtk-4.1'
)
optdepends=(
    'podman: self-hosted TLS container stack via rootless Podman'
    'docker: self-hosted TLS container stack via Docker'
    'xdg-desktop-portal: native file pickers and link opening'
)
provides=('caishen' 'caishen-desktop' 'caishen-host')
conflicts=('caishen' 'caishen-git')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/caishen-$pkgver-linux-$CARCH.tar.gz")
sha256sums=('956141e5dc5436f6087bda27fa757debccdaeea3f7e417ddbce5ae680dd4f013')

package() {
    cd "caishen-$pkgver-linux-$CARCH"
    mkdir -p "$pkgdir/usr"
    cp -a --parents bin share -t "$pkgdir/usr/"
}
