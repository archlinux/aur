# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: envolution
# Contributor: kdh8219 <kdh8219@monamo.dev>

_pkgname="RapidRAW"
pkgname="${_pkgname,,}-bin"
pkgver=1.6.8
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

sha256sums_x86_64=('0f67b099438b17358f2e8596be75f8813341337e73993dd1c097853223360bf9')
sha256sums_aarch64=('8982f9fcf09c305b1f1581246693c62f3c18114e86261ec5a5d552f02a8ed7cf')

package() {
	bsdtar -xf data.tar.* -C "$pkgdir" usr
}
