# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: envolution
# Contributor: kdh8219 <kdh8219@monamo.dev>

_pkgname="RapidRAW"
pkgname="${_pkgname,,}-bin"
pkgver=1.7.0
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

sha256sums_x86_64=('c6ebb6c90b137212e56646c6f415d41d92d58266486937a5d8b8f5b4873796ee')
sha256sums_aarch64=('369017c045f2284ef7c494204d32eaf401e99f4b07ebdb557008e55980294211')

package() {
	bsdtar -xf data.tar.* -C "$pkgdir" usr
}
