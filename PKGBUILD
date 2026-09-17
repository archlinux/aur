# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: envolution
# Contributor: kdh8219 <kdh8219@monamo.dev>

_pkgname="rapidraw"
pkgname="$_pkgname-bin"
pkgver=1.6.4
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

sha256sums_x86_64=('ad40088b3c84890b804705378b4fcb7696640402175d024573c7fdaacbe13cf7')
sha256sums_aarch64=('8c2e9974babfb5b43cd35558ac3a31d481f065d055e358cebb071cdf4ef3ce78')

package() {
	bsdtar -xf data.tar.* -C "$pkgdir" usr
}
