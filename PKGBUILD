# Maintainer: Valentijn V. <deepnavy at waifu dot club>
pkgname=gb-studio-bin
_pkgname=gb-studio
pkgver=1.1.0
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
source=("https://github.com/chrismaltby/gb-studio/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=('dbf09795a07c6e936128fbcab583d2c935628a3c7d448cd95027890d18a9e92b1d6f132883992efaa675667d76f27372a2c9f6c2413a5832c4b39cd11d5c7097')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/lib/gb-studio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/gb-studio/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYRIGHT"

}
