# Maintainer:  Jay Chu <tothesong at gmail dot com>
# Maintainer:  Qz <quadratz@proton.me>
# Contributor: Carson Rueter <roachh at proton mail dot com>
# Contributor: xXR01I1Xx <xxr01i1xx@tuta.io>
# Contributor: Ewhal <ewhal@pantsu.cat>

pkgname=session-desktop-bin
pkgver=1.12.0
pkgrel=2
pkgdesc="Private messaging from your desktop"
arch=(x86_64)
url="https://getsession.org"
license=('GPL3')
depends=(libxtst nss alsa-lib libxss libnotify xdg-utils)
optdepends=('libappindicator-gtk3: for tray support')
provides=(session-messenger-desktop)
conflicts=(session-messenger-desktop session-desktop session-desktop-git session-desktop-appimage)
options=(!strip)
install=$pkgname.install
source=(https://github.com/oxen-io/session-desktop/releases/download/v$pkgver/session-desktop-linux-amd64-$pkgver.deb)
sha256sums=('98825369bff16194c63990b3089cd10c75a81d21748207935f4fee67d5ba611c')

package() {
    tar xf $srcdir/data.tar.xz -C $pkgdir
    chmod 4755 $pkgdir/opt/Session/chrome-sandbox
    install -Ddm0755 $pkgdir/usr/bin
    ln -s $pkgdir/opt/Session/session-desktop $pkgdir/usr/bin/session-messenger-desktop
}
