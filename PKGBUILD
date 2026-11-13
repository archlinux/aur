# Maintainer:  Jay Chu <tothesong at gmail dot com>
# Maintainer:  Qz <quadratz@proton.me>
# Contributor: Carson Rueter <roachh at proton mail dot com>
# Contributor: xXR01I1Xx <xxr01i1xx@tuta.io>
# Contributor: Ewhal <ewhal@pantsu.cat>
# Contributor: SpidFightFR <spidfight@disroot.org>

pkgname=session-desktop-bin
pkgver=1.18.4
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=(x86_64)
url="https://getsession.org"
license=('GPL-3.0-only')
depends=(libxtst nss alsa-lib libxss libnotify xdg-utils)
optdepends=('libappindicator-gtk3: for tray support')
provides=(session-desktop)
conflicts=(session-desktop)
options=(!strip)
source=(https://github.com/session-foundation/session-desktop/releases/download/v$pkgver/session-desktop-linux-amd64-$pkgver.deb)
sha256sums=('c9856d7fb7d56fafb79a285e9aa7da1e1c69e167395aaaf21562d5898aa6f39e')

package() {
    tar --no-same-owner -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    chmod 4755 "$pkgdir/opt/Session/chrome-sandbox"
    install -Ddm0755 "$pkgdir/usr/bin"
    ln -s /opt/Session/session-desktop "$pkgdir/usr/bin/session-messenger-desktop"
}
