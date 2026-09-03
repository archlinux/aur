# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: envolution
# Contributor: kdh8219 <kdh8219@monamo.dev>

_pkgname="rapidraw"
pkgname="$_pkgname-bin"
pkgver=1.6.3
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

sha256sums_x86_64=('b455792645c8c89c4841fe98352bbbb66f4161dbf417fa77788995bec0a05dfa')
sha256sums_aarch64=('1346a610903e8f2906b9c5f1ba9882e7d17bc568709c1f26ef0f6b05aab4b139')

package() {
	bsdtar -xf data.tar.* -C "$pkgdir" usr
}
