# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: envolution
# Contributor: kdh8219 <kdh8219@monamo.dev>

_pkgname="RapidRAW"
pkgname="${_pkgname,,}-bin"
pkgver=1.6.6
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

sha256sums_x86_64=('89354582804d09f41e1cdeafb520d93584cf4e1b5fac42911d66bbd825f20f3e')
sha256sums_aarch64=('60afd22df68f570599d8f89b1c32ebd58b614247bb125e933af5ac8965ba1079')

package() {
	bsdtar -xf data.tar.* -C "$pkgdir" usr
}
