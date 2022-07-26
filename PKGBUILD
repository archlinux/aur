# Maintainer: Jay Chang <changsijay [at] gmail [DoT] com>
# Contributor: Konrad Malik (https://konradmalik.github.io/)

pkgname=evernote-beta-bin
pkgver=10.41.5
buildver=3540-fc7ed4329d
pkgrel=1
pkgdesc="Official Evernote client for Linux (beta, early-access)"
arch=('x86_64')
url="https://evernote.com/earlyaccess"
license=('custom')
provides=('evernote')
depends=(
    'libnotify'
    'libappindicator-gtk3'
    'libxtst'
    'nss'
    'attr'
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
    '84c814d13eaef1904818db72b1d5e1bf58c36ffd58d99bffa51c3b0a5de64bdb'
)

package() {
    # extract only data
    bsdtar -O -xf "Evernote-Beta-${pkgver}-linux-ddl-beta-${buildver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
