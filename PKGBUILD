# Maintainer: terrorwolf <jan.jr03+aur@gmail.com>
pkgname=opendeck-bin
pkgver=2.11.1
pkgrel=1
pkgdesc="A cross-platform desktop application that provides functionality for stream controller devices."
arch=('x86_64')
url="https://github.com/nekename/OpenDeck"
license=('GPL-3.0-or-later')
depends=(libappindicator-gtk3 webkit2gtk-4.1)
optdepends=(
'wine: Needed to support Windows-only plugins'
'wine-mono: Needed to support some Windows-only plugins'
)
provides=("opendeck")
conflicts=("opendeck")
options=('!lto')
source=(
	"https://github.com/nekename/OpenDeck/releases/download/v${pkgver}/opendeck_${pkgver}_amd64.deb"
)

sha256sums=('05c6f997c358935af1a1513ff0439cd638e826ff8f38cd1dd9b87d4c0a46b04f')

package() {
	bsdtar -xf "${srcdir}/opendeck_${pkgver}_amd64.deb" -C "${srcdir}"
	bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
