# Maintainer: Thomas Queiroz <thomasqueirozb @ g m a i l.c o m>
# Contributor: Sergio Schneider <spsf1964 @ g m a i l.c o m>

pkgname=session-desktop-appimage
pkgver=1.9.1
pkgrel=1
#pkgdesc="Private messaging from your desktop"
pkgdesc="Session is an end-to-end encrypted messenger that minimises sensitive metadata"

arch=('x86_64')

#url="https://github.com/loki-project/session-desktop"
url="https://github.com/oxen-io/session-desktop"

license=('GPL3')
depends=('gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss' 'fuse2')
provides=('session-desktop-appimage')
conflicts=('session-desktop' 'session-desktop-bin')

#https://github.com/loki-project/session-desktop/releases/download/1.1.0/session-messenger-desktop-linux-x86_64-1.1.0.AppImage
#https://github.com/loki-project/session-desktop/releases/download/v1.1.2/session-messenger-desktop-linux-x86_64-1.1.2.AppImage
#https://github.com/loki-project/session-desktop/releases/download/v1.4.3/session-desktop-linux-x86_64-1.4.3.AppImage

#_bin="session-messenger-desktop-linux-x86_64-${pkgver}.AppImage"
_bin="session-desktop-linux-x86_64-${pkgver}.AppImage"

#source=("${_bin}::https://github.com/loki-project/session-desktop/releases/download/v${pkgver}/${_bin}"
source=("${_bin}::https://github.com/oxen-io/session-desktop/releases/download/v${pkgver}/${_bin}"
        'session-desktop.desktop'
        'session-desktop.png')

sha256sums=('65cddbb64bcde22738ec81a281e1491b1e1dc1b33e6fb8ae20ec6999c5a6ad14'
            '2bf3c1718e157626851aa1661388353c9a430635058a6e327f5cf4be3161e47b'
            '8f6f2fa7ac49e24551b6a6324e4fd6cd73b478c24f450296c7fd30556c01575c')

options=('!strip' '!emptydirs')

package() {
  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/opt/session-desktop/${_bin}"
  install -Dm644 "${srcdir}/session-desktop.desktop" "${pkgdir}/usr/share/applications/session-desktop.desktop"
  install -Dm644 "${srcdir}/session-desktop.png" "${pkgdir}/opt/session-desktop/session-desktop.png"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/session-desktop/${_bin}" "${pkgdir}/usr/bin/session-desktop"
}
