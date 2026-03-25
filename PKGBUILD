# Maintainer:
# Contributor: envolution
# Contributor: kdh8219 <kdh8219@monamo.dev>

_pkgname="rapidraw"
pkgname="$_pkgname-bin"
pkgver=1.5.2
pkgrel=1
pkgdesc="GPU-accelerated RAW image editor"
url="https://github.com/CyberTimon/RapidRAW"
license=('AGPL-3.0-only')
arch=('x86_64' 'aarch64')

depends=(
  'gtk3'
  'webkit2gtk-4.1'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_ubuntuver=24.04
_debfile="03_RapidRAW_v${pkgver}_ubuntu-${_ubuntuver}"
source_x86_64=("$_pkgname-$pkgver-x86_64.deb"::"$url/releases/download/v${pkgver}/${_debfile}_amd64.deb")
source_aarch64=("$_pkgname-$pkgver-aarch64.deb"::"$url/releases/download/v${pkgver}/${_debfile}-arm_arm64.deb")
sha256sums_x86_64=('42f2938ea261655a3e1c835889b9f55b4d3735559a0db8101b898e40e2f37af6')
sha256sums_aarch64=('2e262ef0407ff594d3686db46f828191106f336931ddcf49e5f1663ad396da8c')

package() {
  bsdtar -xf data.tar.* -C "$pkgdir" usr
}
