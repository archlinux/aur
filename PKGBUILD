# Maintainer: Konrad Malik (https://konradmalik.github.io/)

pkgname=evernote-beta-bin
pkgver=10.21.5
buildver=2931
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
    'a5ce3884a4bd638b2eee62d8953b71c7b5e64e71b8c8959672e263db14606d54'
)

package() {
    # extract only data
    bsdtar -O -xf "Evernote-Beta-${pkgver}-linux-ddl-beta-${buildver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
