# Maintainer: Zappo-II <31073175+Zappo-II@users.noreply.github.com>
# SPDX-FileCopyrightText: 2026 Zappo-II
# SPDX-License-Identifier: GPL-2.0-or-later
#
# Installs the static binary from the GitHub release. Locally: `make arch`
# (uses build/'s tarball instead of downloading). pkgver, sha256sums and
# .SRCINFO are updated by `make aur`, which `make release` runs.
pkgname=rg-helper-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Input helper for the RidiculousGnome GNOME Shell extension (evdev, system service)"
arch=('x86_64')
url="https://github.com/Zappo-II/ridiculousgnome"
license=('GPL-2.0-or-later' 'MIT' 'Zlib' 'Unicode-3.0')
depends=('systemd')
provides=('rg-helper')
conflicts=('rg-helper')
backup=('etc/rg-helper.conf')
options=('!strip' '!debug')
install=rg-helper-bin.install
source=("https://github.com/Zappo-II/ridiculousgnome/releases/download/v$pkgver/rg-helper-$pkgver-x86_64.tar.gz")
sha256sums=('6f9862cff3f5d996f20cc4ab2911f3b1edcac56deddfe26bdf46d1326913b9b6')

package() {
    cd "rg-helper-$pkgver"
    DESTDIR="$pkgdir" LIBEXECDIR=/usr/lib/rg-helper LICENSEDIR="/usr/share/licenses/$pkgname" ./install.sh
}
