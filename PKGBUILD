# Maintainer: syl <arch@mail.roidagaubert.net>
# Repack of the official Debian package published at
# https://proton.me/download/lumo/linux/<version>/Lumo_<version>_amd64.deb
pkgname=lumo-bin
pkgver=0.5.9
pkgrel=1
pkgdesc="Official desktop client for Lumo, Proton's privacy-first AI assistant"
arch=('x86_64')
url="https://lumo.proton.me"
license=('GPL3')
options=('!debug')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator'
         'dbus' 'gdk-pixbuf2' 'libsoup3' 'cairo' 'glib2' 'libgcc')
optdepends=('gnome-keyring: secure credential storage'
            'kwallet: secure credential storage (KDE)')
provides=('lumo')
conflicts=('lumo')
source=("Lumo_${pkgver}_amd64.deb::https://proton.me/download/lumo/linux/${pkgver}/Lumo_${pkgver}_amd64.deb"
        "LICENSE")
sha512sums=('583cb312424c0874aae03c61afde5653c0104655592ea574a8ae2daef9f61bb750714eb25f37fc396f278519373017b3297c281aa16d273b35746bb561b35e26'
            '2516f99b667fcb3f35a2a8b3d2f3a24b5a5be2c2ba3012adc1468e76ac7f8f083e46c93c8b5122ae61eb5dc28f1e39f115ba6a05a6b8fb9f24ac428e89df85b4')

package() {
    bsdtar -Oxf "Lumo_${pkgver}_amd64.deb" data.tar.gz | bsdtar -xf - -C "${pkgdir}"

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
