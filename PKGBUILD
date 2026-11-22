# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: envolution
# Contributor: kdh8219 <kdh8219@monamo.dev>

_pkgname="RapidRAW"
pkgname="${_pkgname,,}-bin"
pkgver=1.7.1
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

sha256sums_x86_64=('6a8684d73bbad4750c1253d2c0599478f10bf8e3c74697e4f268e6a2261151e2')
sha256sums_aarch64=('d4a1dec3cfb929e4cc4095654bd1271cef63751156c4d5a133080650fad79cfc')

package() {
	bsdtar -xf data.tar.* -C "$pkgdir" usr
}
