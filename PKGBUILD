# Maintainer: Konrad Malik (https://konradmalik.github.io/)

pkgname=evernote-beta-bin
pkgver=10.7.6
buildver=2330
pkgrel=6
pkgdesc="Official Evernote client for Linux (beta, early-access)"
arch=('x86_64')
url="https://evernote.com/earlyaccess"
license=('custom')
provides=('evernote')
depends=(
    'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils'
    'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret'
)
optdepends=('gnome-keyring: for credentials persistence after reboot')
conflicts=('evernote-for-linux-bin')
replaces=()
install=$pkgname.install
source=(
    "https://cdn1.evernote.com/boron/linux/builds/Evernote-${pkgver}-linux-ddl-ga-${buildver}.deb"
    )
noextract=("Evernote-${pkgver}-linux-ddl-ga-${buildver}.deb")
sha256sums=(
    '14a920801f8865dadbc5a1544e8051bb0b7bb66535575459f4f372d89170342f'
)

package() {
    # extract only data
    bsdtar -O -xf "Evernote-${pkgver}-linux-ddl-ga-${buildver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
