# Maintainer: terrorwolf <jan.jr03+aur@gmail.com>
pkgname=opendeck-bin
pkgver=v2.7.0
pkgrel=1
pkgdesc="A cross-platform desktop application that provides functionality for stream controller devices."
arch=('x86_64')
url="https://github.com/nekename/OpenDeck"
license=('GPL-3.0')
makedepends=(git dpkg)
depends=(libappindicator-gtk3 webkit2gtk-4.1)
optdepends=(
'wine: Needed to support Windows-only plugins'
'wine-mono: Needed to support some Windows-only plugins'
)
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!lto')
source=(
	"https://github.com/nekename/OpenDeck/releases/download/v2.7.0/opendeck_2.7.0_amd64.deb"
)

sha256sums=('f4aa60a6edaf549c131d381e02e5ef8db66fa21c415ecf1375a3af8579ae0330')

package() {
	bsdtar -xf "${srcdir}/opendeck_2.7.0_amd64.deb" -C "${pkgdir}"
	rm -rf $pkgdir/DEBIAN
}
