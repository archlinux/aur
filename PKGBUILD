# Maintainer: adriadam10 <adriadam10 at gmail dot com>
pkgname=matty-bin
_pkgver=0.1.0-beta.32
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc='Fast native Mattermost client written in Rust with GPUI (prebuilt)'
arch=('x86_64')
url='https://github.com/karyalabs/matty'
license=('MIT')
depends=('glibc' 'gcc-libs' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11'
         'fontconfig' 'wayland' 'vulkan-icd-loader' 'dbus')
optdepends=('gnome-keyring: keep the session in the Secret Service'
            'kwallet: keep the session in the Secret Service (KDE)')
provides=('matty')
conflicts=('matty')
options=('!strip' '!debug')
source=("https://github.com/karyalabs/matty/releases/download/v${_pkgver}/Matty-${_pkgver}-linux-x86_64.tar.gz")
sha256sums=('e5fe1cbc4a528c468522253d23297ebb84361c97d481d50450ee2e736e8e5464')

package() {
  cp -a usr "$pkgdir/"
  install -Dm644 usr/share/doc/matty/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
