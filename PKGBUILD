# Maintainer: Thomas Mashos <thomas at mashos dot com>
# Maintainer: devolutionsinfra https://devolutions.net/
pkgname=remote-desktop-manager
pkgver=2024.3.1.3
pkgrel=1
pkgdesc="Devolutions Remote Desktop Manager centralizes all remote connections on a single platform that is securely shared between users and across the entire team."
arch=('x86_64')
url="https://remotedesktopmanager.com/"
license=('Proprietary')
groups=()
depends=('ca-certificates' 'libsecret' 'vte3' 'webkit2gtk-4.1')
optdepends=('libappindicator-gtk3: for system tray icon support'
            'lsof'
            'org.freedesktop.secrets: secret storage backend'
            'xdotool: for executing typing macros')
options=(!strip)
install=${pkgname}.install
source=("RemoteDesktopManager_${pkgver}_amd64.deb::https://cdn.devolutions.net/download/Linux/RDM/${pkgver}/RemoteDesktopManager_${pkgver}_amd64.deb")
sha256sums=('0F462F0E716FB842F848FB7198E851AB3CAD3F02C99E43DD991804EB322E98B1')

prepare() {
  tar -xf ${srcdir}/data.tar.xz
}

package() {
  mv "usr/" "${pkgdir}/"
  install -Dm755 "${srcdir}/bin/remotedesktopmanager" "${pkgdir}/usr/bin/remotedesktopmanager"
}

