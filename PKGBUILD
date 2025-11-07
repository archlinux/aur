# Maintainer: Thomas Mashos <thomas at mashos dot com>
# Maintainer: devolutionsinfra https://devolutions.net/
pkgname=remote-desktop-manager
pkgver=2025.3.0.9
pkgrel=1
pkgdesc="Devolutions Remote Desktop Manager centralizes all remote connections on a single platform that is securely shared between users and across the entire team."
arch=('x86_64')
url="https://remotedesktopmanager.com/"
license=('Proprietary')
groups=()
depends=('ca-certificates' 'libsecret' 'vte3' 'webkit2gtk-4.1' 'xorg-server-xwayland')
optdepends=('libappindicator-gtk3: for system tray icon support'
            'lsof'
            'org.freedesktop.secrets: secret storage backend'
            'xdotool: for executing typing macros')
options=(!strip)
install=${pkgname}.install
source=("RemoteDesktopManager_${pkgver}_amd64.deb::https://cdn.devolutions.net/download/Linux/RDM/${pkgver}/RemoteDesktopManager_${pkgver}_amd64.deb")
sha256sums=('24E87202623EAB288DB74FB8B68518226205F098A93F13A674BBD3D2436BDBF0')

prepare() {
  tar -xf ${srcdir}/data.tar.xz
}

package() {
  mv "usr/" "${pkgdir}/"
  install -Dm755 "${srcdir}/bin/remotedesktopmanager" "${pkgdir}/usr/bin/remotedesktopmanager"
}

