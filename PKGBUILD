# Maintainer: juddisjudd <juddisjudd at users dot noreply dot github dot com>
pkgname=bawkseek-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Soulseek client and audio player'
arch=('x86_64')
url='https://github.com/juddisjudd/bawkseek'
license=('AGPL-3.0-only')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader' 'wayland')
optdepends=('gnome-keyring: remember your password'
            'kwallet: remember your password')
provides=('bawkseek')
conflicts=('bawkseek')
options=('!strip' '!debug')
source=("https://github.com/juddisjudd/bawkseek/releases/download/v${pkgver}/bawkseek-v${pkgver}-linux-x64.tar.gz")
sha256sums=('ffaae72936839805eb4acf884d8ecc04d68bf663dabeb700ee2323976e1e00e9')

package() {
  cd "bawkseek-v${pkgver}-linux-x64"
  install -Dm755 bawkseek "${pkgdir}/usr/bin/bawkseek"
  install -Dm644 bawkseek.desktop "${pkgdir}/usr/share/applications/bawkseek.desktop"
  install -Dm644 bawkseek.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/bawkseek.png"
}
