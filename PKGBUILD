# Maintainer: Alexander Jacocks <alexander@redhat.com>
# Contributor: Konrad Malik (https://konradmalik.github.io/)

pkgname=evernote-for-linux-bin
pkgver=10.60.4
buildver=stable
_archivename="evernote-client_${pkgver}-${buildver}_amd64.deb"
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
    "https://github.com/search5/Evernote-for-Linux/releases/download/v${pkgver}-linux-ddl-ga-${buildver}/${_archivename}"
    )
noextract=("${_archivename}")
sha256sums=('6465469e3ac3cfeb1ecb3de9b3168713ec2469bf944dfa4d375779e63c2f7476')

package() {
    # extract only data
    bsdtar -O -xf "${_archivename}" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
