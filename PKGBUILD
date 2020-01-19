# Maintainer: Valentijn V. <neko at catgirlsin dot space>
pkgname=gb-studio-bin
_pkgname=GB-Studio
pkgver=1.2.1
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
source=("https://github.com/chrismaltby/gb-studio/releases/download/v${pkgver}/${_pkgname}-Linux-DEB-${pkgver}.zip")
sha512sums=('342ec9c823f2432a824b5aa06303ecca48bc93dfe12d0d5a3f34f13eec66f2a0de94ea664afe008ca6b3c5cc2ab8be76766e65f4da5ab7ef27793af993fe3ee9')

prepare(){
        bsdtar -xf gb-studio-master-linux_x86_64.deb
}

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/lib/gb-studio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/gb-studio/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYRIGHT"

}
