# Maintainer: syl <arch@mail.roidagaubert.net>
# Repack of the official Debian package published at
# https://proton.me/download/lumo/linux/<version>/Lumo_<version>_amd64.deb
pkgname=lumo-bin
pkgver=0.5.10
pkgrel=1
pkgdesc="Official desktop client for Lumo, Proton's privacy-first AI assistant"
arch=('x86_64')
url="https://lumo.proton.me"
license=('GPL-3.0-only')
options=('!debug')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator'
         'dbus' 'gdk-pixbuf2' 'libsoup3' 'cairo' 'glib2' 'libgcc')
optdepends=('gnome-keyring: secure credential storage'
            'kwallet: secure credential storage (KDE)')
provides=('lumo')
conflicts=('lumo')
source=("Lumo_${pkgver}_amd64.deb::https://proton.me/download/lumo/linux/${pkgver}/Lumo_${pkgver}_amd64.deb")
sha512sums=('5a3a959865f0f18940d4be251f12323b7d2b0c042628c7ce8066eb68918b54973d7e1baf00afc32dcb0e404c945422e31b01a509bee0d9c068187981cb956b85')

package() {
    bsdtar -Oxf "Lumo_${pkgver}_amd64.deb" data.tar.gz | bsdtar -xf - -C "${pkgdir}"
}
