# Maintainer: Konrad Malik (https://konradmalik.github.io/)

pkgname=evernote-for-linux-bin
pkgver=10.17.6
buildver=2775
pkgrel=1
pkgdesc="Official Evernote client for Windows repackaged for Linux"
arch=('x86_64')
url="https://github.com/search5/Evernote-for-Linux"
license=('custom')
provides=('evernote')
depends=(
    'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils'
    'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret'
)
optdepends=()
conflicts=("evernote-beta-bin")
replaces=()
install=$pkgname.install
source=(
    "https://github.com/search5/Evernote-for-Linux/releases/download/${pkgver}-linux-ddl-ga-${buildver}/evernote-client_${pkgver}_amd64.deb"
    )
noextract=("evernote-client_${pkgver}_amd64.deb")
sha256sums=(
    '8f8c2fd10c65c99c3a97c91438779ea4405474747c45f6b7efcdfeea0a3315d2'
)

package() {
    # extract only data
    bsdtar -O -xf "evernote-client_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
