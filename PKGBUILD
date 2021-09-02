# Maintainer: Konrad Malik (https://konradmalik.github.io/)

pkgname=evernote-for-linux-bin
pkgver=10.20.4
buildver=2893
pkgrel=1
pkgdesc="Official Evernote client for Windows repackaged for Linux"
arch=('x86_64')
url="https://github.com/search5/Evernote-for-Linux"
license=('custom')
provides=('evernote')
depends=(
    'libnotify' 'libappindicator-gtk3' 'libxtst' 'nss' 'attr'
)
optdepends=('gnome-keyring: for credentials persistence after reboot')
conflicts=("evernote-beta-bin" "evernote-bin")
replaces=()
install=$pkgname.install
source=(
    "https://github.com/search5/Evernote-for-Linux/releases/download/v${pkgver}-linux-ddl-ga-${buildver}/evernote-client_${pkgver}_amd64.deb"
    )
noextract=("evernote-client_${pkgver}_amd64.deb")
sha256sums=(
    '6898fe960b707270f6effc938e0c9dcb4f9288c02f968c597378f842c401e3e7'
)

package() {
    # extract only data
    bsdtar -O -xf "evernote-client_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
