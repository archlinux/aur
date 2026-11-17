# Maintainer: syl <arch@mail.roidagaubert.net>
pkgname=lumo-bin
pkgver=0.5.9
pkgrel=1
pkgdesc="Lumo: your private AI assistant by Proton"
arch=('x86_64')
url="https://lumo.proton.me"
license=('LicenseRef-Proprietary')   # à vérifier dans /usr/share/doc/lumo/ après install
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator'
         'dbus' 'gdk-pixbuf2' 'libsoup3' 'cairo' 'glib2' 'libgcc')
optdepends=('gnome-keyring: secure credential storage'
            'kwallet: secure credential storage (KDE)')
provides=('lumo')
conflicts=('lumo')
source=("Lumo_${pkgver}_amd64.deb::https://proton.me/download/lumo/linux/${pkgver}/Lumo_${pkgver}_amd64.deb")
sha512sums=('583cb312424c0874aae03c61afde5653c0104655592ea574a8ae2daef9f61bb750714eb25f37fc396f278519373017b3297c281aa16d273b35746bb561b35e26')

package() {
    bsdtar -Oxf "Lumo_${pkgver}_amd64.deb" data.tar.gz | bsdtar -xf - -C "${pkgdir}"
}
