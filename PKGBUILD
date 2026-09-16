# Maintainer: Thomas Mashos <thomas at mashos dot com>
# Maintainer: devolutionsinfra https://devolutions.net/
pkgname=remote-desktop-manager
pkgver=2026.3.0.5
pkgrel=1
pkgdesc="Devolutions Remote Desktop Manager centralizes all remote connections on a single platform that is securely shared between users and across the entire team."
arch=('x86_64')
url="https://remotedesktopmanager.com/"
license=('Proprietary')
groups=()
depends=('ca-certificates' 'libsecret' 'vte3' 'webkit2gtk-4.1' 'xorg-server-xwayland')
optdepends=('fuse3: for copying files from an RDP connection'
            'libappindicator-gtk3: for system tray icon support'
            'lsof'
            'org.freedesktop.secrets: secret storage backend'
            'xdotool: for executing typing macros'
            'openal'
            'libfido2')
options=(!strip)
install=${pkgname}.install
source=("RemoteDesktopManager_${pkgver}_amd64.deb::https://cdn.devolutions.net/download/Linux/RDM/${pkgver}/RemoteDesktopManager_${pkgver}_amd64.deb")
sha256sums=('7A08F8AF70F293230B105F5BE62E56A7562D17BAEAEC4EBB341B9D6FE18243BD')

prepare() {
  tar -xf ${srcdir}/data.tar.xz
}

package() {
  mv "usr/" "${pkgdir}/"
  install -Dm755 "${srcdir}/bin/remotedesktopmanager" "${pkgdir}/usr/bin/remotedesktopmanager"
}

