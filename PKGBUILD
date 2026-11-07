# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: envolution
# Contributor: kdh8219 <kdh8219@monamo.dev>

_pkgname="RapidRAW"
pkgname="${_pkgname,,}-bin"
pkgver=1.6.9
pkgrel=1
pkgdesc="GPU-accelerated RAW image editor"

url="https://github.com/CyberTimon/RapidRAW"
license=('AGPL-3.0-only')
arch=('x86_64' 'aarch64')

depends=(
  'gtk3'
  'dbus'
  'cairo'
  'libsoup3'
  'gdk-pixbuf2'
  'webkit2gtk-4.1'
)

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")

_ubuntuver=24.04
_debfile="03_RapidRAW_v${pkgver}_ubuntu-${_ubuntuver}"

source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.deb"::"$url/releases/download/v${pkgver}/${_debfile}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.deb"::"$url/releases/download/v${pkgver}/${_debfile}-arm_arm64.deb")

sha256sums_x86_64=('a7396b25f7f18b514d216c86140ed4b81776ebb688a9b80396127de3691a5833')
sha256sums_aarch64=('811b30131f6e5279b035bd04943348e43ac4e2bba40996ee3765ff0a7f988bc7')

package() {
	bsdtar -xf data.tar.* -C "$pkgdir" usr
}
