# Maintainer: Matthew Spangler. <mattspangler at protonmail dot com>
# Contributor: Valentijn V. <neko at catgirlsin dot space>
pkgname=gb-studio-bin
_pkgname=GB-Studio
pkgver=3.1.0
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
source=("https://github.com/chrismaltby/gb-studio/releases/download/v${pkgver}/gb-studio-linux-debian.deb")
sha512sums=('eea859cc9832663835ab5b8625c08273ca99a7da9e8ee41a479c14dd3ca9cad9bb382c3a2ca2f9049a634b82d68ffe1b990e215cf7af90ba17df770562a87c6c')

prepare(){
        bsdtar -xf gb-studio-linux-debian.deb
}

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/lib/gb-studio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/gb-studio/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYRIGHT"
}
