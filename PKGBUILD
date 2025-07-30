# Maintainer:  Jay Chu <tothesong at gmail dot com>
# Maintainer:  Qz <quadratz@proton.me>
# Contributor: Carson Rueter <roachh at proton mail dot com>
# Contributor: xXR01I1Xx <xxr01i1xx@tuta.io>
# Contributor: Ewhal <ewhal@pantsu.cat>

pkgname=session-desktop-bin
pkgver=1.16.5
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
sha256sums=('600dbf9c05a9eb8105b5ea23dae3c649c79a8637097059eb4388dbb8e679b5a2')

package() {
    tar xf $srcdir/data.tar.xz -C $pkgdir
    chmod 4755 $pkgdir/opt/Session/chrome-sandbox
    install -Ddm0755 $pkgdir/usr/bin
    ln -s /opt/Session/session-desktop $pkgdir/usr/bin/session-messenger-desktop
}
