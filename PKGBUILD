# Maintainer: Valentijn V. <neko at catgirlsin dot space>
pkgname=gb-studio-bin
_pkgname=GB-Studio
pkgver=1.2.0
pkgrel=1
pkgdesc="Visual retro game maker"
arch=('x86_64')
url="https://gbstudio.dev"
license=('MIT')
groups=('')
replaces=('gb-studio')
provides=('gb-studio')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'util-linux' 'trash-cli')
optdepends=('pulseaudio: sound support')
options=('!strip' '!emptydirs')
source=("https://github.com/chrismaltby/gb-studio/releases/download/v${pkgver}/${_pkgname}-Linux-DEB-${pkgver}.deb")
sha512sums=('c09e6c1ec47e1d0aac7728fb1c41eb49b6ab652457a86edc459714e585e0d8e2f2630d18af2fccca5dfbaab0df9ffbc518e3dd10a42096ec25950c30f0ff2f69')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/lib/gb-studio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/gb-studio/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYRIGHT"

}
