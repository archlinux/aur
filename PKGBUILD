# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Contributor: Thomas Queiroz <thomasqueirozb @ g m a i l.c o m>
# Contributor: Sergio Schneider <spsf1964 @ g m a i l.c o m>

pkgname=session-desktop-appimage
pkgver=1.10.3
pkgrel=1
pkgdesc="Private messaging from your desktop (AppImage version)"
arch=('x86_64')
url="https://github.com/oxen-io/session-desktop"
license=('GPL3')
depends=('gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss' 'fuse2')
provides=('session-desktop-appimage')
conflicts=('session-desktop' 'session-desktop-bin' 'session-desktop-git')

_bin="session-desktop-linux-x86_64-${pkgver}.AppImage"
source=("${_bin}::https://github.com/oxen-io/session-desktop/releases/download/v${pkgver}/${_bin}"
        'session-desktop.desktop'
        'session-desktop.png')
sha512sums=('6b5fe1d4a1d741bc04e1b219977cd80d9b197cf1c82efe766ad6cbec19d9f188e6100d810071e4bf83af03afed86c00e94545910b4c4deaa872a7257e13fa3a9'
            '96e2a021ebf7a5904cbd47aabf8d03f450a3ee2831d7ecfad5f1518b4214609acc9fd51ad8ca189875c19a99f28f7fd71e5028999c58e404210f2401f4e6babd'
            '209d1483601018e2191719117a59da3112570b2e1ae176337a918d4ab2c4032dfddf14d42e4a3b2153888167e694542bbc1f42297589d035ab29f2578877425d')

options=('!strip' '!emptydirs')

package() {
  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/opt/session-desktop/${_bin}"
  install -Dm644 "${srcdir}/session-desktop.desktop" "${pkgdir}/usr/share/applications/session-desktop.desktop"
  install -Dm644 "${srcdir}/session-desktop.png" "${pkgdir}/opt/session-desktop/session-desktop.png"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/session-desktop/${_bin}" "${pkgdir}/usr/bin/session-desktop"
}
