# Maintainer: terrorwolf <jan.jr03+aur@gmail.com>
pkgname=opendeck-bin
pkgver=2.13.1
pkgrel=1
pkgdesc="A cross-platform desktop application that provides functionality for stream controller devices."
arch=('x86_64')
url="https://github.com/nekename/OpenDeck"
license=('GPL-3.0-or-later')
depends=(libappindicator-gtk3 webkit2gtk-4.1)
optdepends=(
'wine: Needed to support Windows-only plugins'
'wine-mono: Needed to support some Windows-only plugins'
'nodejs: Needed to support  Node.js plugins'
)
provides=("opendeck")
conflicts=("opendeck")
options=('!lto')
source=(
	"https://github.com/nekename/OpenDeck/releases/download/v${pkgver}/opendeck_${pkgver}_amd64.deb"
)

sha256sums=('e13aedd2ffbc19e551d9efaf4b0343d206c814278fb3f9883d51398a06876f28')

package() {
	bsdtar -xf "${srcdir}/opendeck_${pkgver}_amd64.deb" -C "${srcdir}"
	bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
