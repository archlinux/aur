# Maintainer: Core_UK <mail.coreuk@gmail.com>

pkgname=apple-music-electron-bin
_pkgnamelow=apple-music-electron
_pkgname=Apple-Music-Electron
pkgver=3.0.0
pkgrel=2
pkgdesc="An open-source, GPU-accelerated Electron application that emulates the Apple Music website in a customizable interface. Binary release that builds from most recent release on GitHub (Uses .deb file)."
arch=('i686' 'x86_64')
url="https://github.com/Apple-Music-Electron/${_pkgname}.git"
license=("MIT")
options=('!strip' '!emptydirs')
install=${_pkgnamelow}.install
depends=('gtk3' 'nss')
makedepends=('desktop-file-utils' 'xdg-utils')
optdepends=('libnotify: Playback notifications'
            'otf-san-francisco: Use of SF Font for certain themes')
provides=(${pkgname} ${_pkgnamelow})
conflicts=(${_pkgnamelow})
source=("https://github.com/Apple-Music-Electron/${_pkgname}/releases/download/v${pkgver}/apple-music-electron_${pkgver}_amd64.deb"
        "apple-music-electron.install")
sha256sums=('5eb8497256995158b0e539d464122d81d281a195b3eaf941fcef4fc94e70b501'
            'b82a3d4ec0cac09d76346db489faa1a526f3e8e5c2d4d2c56c91416fc9c45f88')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
