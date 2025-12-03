# Maintainer: terrorwolf <jan.jr03+aur@gmail.com>
pkgname=opendeck-bin
pkgver=v2.7.1
pkgrel=1
pkgdesc="A cross-platform desktop application that provides functionality for stream controller devices."
arch=('x86_64')
url="https://github.com/nekename/OpenDeck"
license=('GPL-3.0')
depends=(libappindicator-gtk3 webkit2gtk-4.1)
optdepends=(
'wine: Needed to support Windows-only plugins'
'wine-mono: Needed to support some Windows-only plugins'
)
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!lto')
source=(
	"https://github.com/nekename/OpenDeck/releases/download/v2.7.1/opendeck_2.7.1_amd64.deb"
)

sha256sums=('426ed8f42124595f48956fe70dd3e78747045173c6b3fb4c39774460960ac13c')

package() {
	bsdtar -xf "${srcdir}/opendeck_2.7.1_amd64.deb" -C "${srcdir}"
	bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
