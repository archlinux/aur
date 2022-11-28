# Maintainer: Jay Chang <changsijay [at] gmail [DoT] com>
# Contributor: Konrad Malik (https://konradmalik.github.io/)

pkgname=evernote-beta-bin
pkgver=10.49.4
buildver=3782-127ce42593
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
    'f39d02e5f74ac77d6ba8abc853f678f2936ef910f5f8d72b58e727b3fd80c40d'
)

package() {
    # extract only data
    bsdtar -O -xf "Evernote-Beta-${pkgver}-linux-ddl-beta-${buildver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
