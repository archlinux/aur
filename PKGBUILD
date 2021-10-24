# Maintainer: Konrad Malik (https://konradmalik.github.io/)

pkgname=evernote-beta-bin
pkgver=10.23.10
buildver=3027
pkgrel=1
pkgdesc="Official Evernote client for Linux (beta, early-access)"
arch=('x86_64')
url="https://evernote.com/earlyaccess"
license=('custom')
provides=('evernote')
depends=(
    'libnotify' 'libappindicator-gtk3' 'libxtst' 'nss' 'attr'
)
optdepends=('gnome-keyring: for credentials persistence after reboot')
conflicts=('evernote-for-linux-bin' 'evernote-bin')
replaces=()
install=$pkgname.install
source=(
    "https://cdn1.evernote.com/boron/linux/builds/Evernote-Beta-${pkgver}-linux-ddl-beta-${buildver}.deb"
    )
noextract=("Evernote-Beta-${pkgver}-linux-ddl-beta-${buildver}.deb")
sha256sums=(
    '460f0223fb3796a0acb056ecd926cf19b28dbc076876dca4d1d9e12593226797'
)

package() {
    # extract only data
    bsdtar -O -xf "Evernote-Beta-${pkgver}-linux-ddl-beta-${buildver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
