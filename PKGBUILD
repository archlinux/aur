# Maintainer:
# Contributor: envolution
# Contributor: kdh8219 <kdh8219@monamo.dev>

_pkgname="rapidraw"
pkgname="$_pkgname-bin"
pkgver=1.5.3
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
sha256sums_x86_64=('72de53df9cefdf9810a02206b03704a24ad979fabde16c1b2845c74e48ac1e55')
sha256sums_aarch64=('4dd5adfebdee0c07434f753e5fd4801b5258191456185ee3f8c87bb3164d2ff9')

package() {
  bsdtar -xf data.tar.* -C "$pkgdir" usr
}
