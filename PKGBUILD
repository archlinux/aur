# Maintainer:
# Contributor: envolution
# Contributor: kdh8219 <kdh8219@monamo.dev>

_pkgname="rapidraw"
pkgname="$_pkgname-bin"
pkgver=1.5.4
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
sha256sums_x86_64=('ebf540b395cf661261c5c56524a31a568a2889311b96006a8536e59ebd187f45')
sha256sums_aarch64=('11afba4beff3e3b62d55051909a47fc0a98525ac301633ae2e520f8bcb686fdb')

package() {
  bsdtar -xf data.tar.* -C "$pkgdir" usr
}
