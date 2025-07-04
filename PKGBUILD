# Maintainer: KozaKrisz <hello@kozakrisz.dev>

_pkgname=pacmanager
pkgname=${_pkgname}-bin
pkgver=0.1.0             
pkgrel=1
pkgdesc="This application provides a user-friendly graphical interface for managing both official Arch Linux packages via pacman and AUR (Arch User Repository) packages via yay."
arch=('x86_64')
url="https://github.com/KriszKecskes/pacmanager"
license=('custom')       
depends=('gtk3' 'webkit2gtk' 'libayatana-appindicator' 'openssl-1.1') 
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")

# A letöltött fájl sértetlenségét ellenőrző checksum.
# Ezt minden verzióváltáskor frissíteni kell!
# Generálása: `sha256sum a_fájl_neve` vagy `updpkgsums` paranccsal.
sha256sums=('aeaee7e5841da84687472a62665b9f0f4dfa24afe6da3c343264eb0745f2add8')

package() {
  bsdtar -x -f "${srcdir}/${_pkgname}-${pkgver}.deb" -C "${srcdir}"
  bsdtar -x -f "${srcdir}/data.tar."* -C "${pkgdir}"
}