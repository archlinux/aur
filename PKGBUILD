# Maintainer: Jay Chang <changsijay [at] gmail [DoT] com>
# Contributor: Konrad Malik (https://konradmalik.github.io/)

pkgname=evernote-beta-bin
pkgver=10.35.3
buildver=3355-f684e12257
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
    '9216bc8a609048ad9d3491528cfd52a1e11f3b2d5f660ea182b381ebe33b96db'
)

package() {
    # extract only data
    bsdtar -O -xf "Evernote-Beta-${pkgver}-linux-ddl-beta-${buildver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
