# Maintainer: Sergio Schneider <spsf1964@gmail.com>
# Contributor:Thomas Queiroz <thomasqueirozb@gmail.com>

pkgname=nixnote2-appimage
pkgver=2.1.6
pkgrel=1
pkgdesc="Nixnote is Evernote desktop client for Linux and macOS"
arch=('x86_64')
url="https://github.com/robert7/nixnote2"
license=('GPL3')
depends=('gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
provides=('nixnote2-appimage')
conflicts=('nixnote2' 'nixnote2-git')

#https://github.com/robert7/nixnote2/releases/download/v2.1.6/NixNote2-x86_64.AppImage

#_bin="session-messenger-desktop-linux-x86_64-${pkgver}.AppImage"

_bin="NixNote2-x86_64.AppImage"
source=("${_bin}::https://github.com/robert7/nixnote2/releases/download/v${pkgver}/${_bin}"
        'nixnote2.desktop'
        'nixnote2.png')

sha256sums=('ce8821c816c1b7f10f95c1bb076e6761fb8a95bbc65baa5bf7df6b5425189eee'
            'ef23c8f133114827ed455d4f4bb88394b1209159c3b37e04f829619ed093b8bd'
            '4272984c0eae4f8b3f38285d5c7f11ee7cd854df4edfd607395314074d658edc')

options=('!strip' '!emptydirs')
package() {
  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/opt/nixnote2/${_bin}"
  install -Dm644 "${srcdir}/nixnote2.desktop" "${pkgdir}/usr/share/applications/nixnote2.desktop"
  install -Dm644 "${srcdir}/nixnote2.png" "${pkgdir}/opt/nixnote2/nixnote2.png"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/nixnote2/${_bin}" "${pkgdir}/usr/bin/nixnote2"
}
