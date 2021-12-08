# Maintainer: Core_UK <mail.coreuk@gmail.com>
# Contributor: Fabio Loli <fabio.loli@disroot.org>

pkgname=apple-music-electron-bin
_pkgname=Apple-Music-Electron
pkgver=3.0.0
pkgrel=3
pkgdesc="An open-source, GPU-accelerated Electron application that emulates the Apple Music website in a customizable interface."
arch=('x86_64')
url="https://github.com/CiderApp/${_pkgname}.git"
license=("MIT")
options=('!strip' '!emptydirs')
depends=('gtk3' 'nss')
optdepends=('libnotify: Playback notifications'
            'otf-san-francisco: Use of SF Font for certain themes')
provides=(apple-music-electron)
conflicts=(apple-music-electron)
source=("https://github.com/CiderApp/${_pkgname}/releases/download/v${pkgver}/apple-music-electron_${pkgver}_amd64.deb")
sha256sums=('d8a91c0171bde307e7da0eb3a40131c999b49c2fa59a7442fbce19f2b9d519b7')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

    chmod 4755 "${pkgdir}/opt/Apple Music/chrome-sandbox"

    install -d "${pkgdir}/usr/bin"
	ln -sf '/opt/Apple Music/apple-music-electron' "${pkgdir}/usr/bin/apple-music-electron"
}
