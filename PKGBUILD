# Maintainer: Thomas Mashos <thomas at mashos dot com>
# Maintainer: devolutionsinfra https://devolutions.net/
pkgname=remote-desktop-manager
pkgver=2024.2.0.10
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
sha256sums=('F45A95335D36E812323B57D3A1318340F02728F3DC77FE0DBC727B7E6F040097')

prepare() {
  tar -xf ${srcdir}/data.tar.xz
}

package() {
  mv "usr/" "${pkgdir}/"
  install -Dm755 "${srcdir}/bin/remotedesktopmanager" "${pkgdir}/usr/bin/remotedesktopmanager"
}

