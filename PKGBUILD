# Maintainer: Konrad Malik (https://konradmalik.github.io/)

pkgname=evernote-for-linux-bin
pkgver=10.17.8
buildver=2809
pkgrel=2
pkgdesc="Official Evernote client for Windows repackaged for Linux"
arch=('x86_64')
url="https://github.com/search5/Evernote-for-Linux"
license=('custom')
provides=('evernote')
depends=(
    'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils'
    'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret'
)
optdepends=('gnome-keyring: for credentials persistence after reboot')
conflicts=("evernote-beta-bin")
replaces=()
install=$pkgname.install
source=(
    "https://github.com/search5/Evernote-for-Linux/releases/download/v${pkgver}-linux-ddl-ga-${buildver}/evernote-client_${pkgver}_amd64.deb"
    )
noextract=("evernote-client_${pkgver}_amd64.deb")
sha256sums=(
    '940d224366865696a203bf3f6f7387a0b0bc47c1f651ac40ac02ce3d0019132f'
)

package() {
    # extract only data
    bsdtar -O -xf "evernote-client_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
