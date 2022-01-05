# Maintainer: Valentijn V. <neko at catgirlsin dot space>
pkgname=gb-studio-bin
_pkgname=GB-Studio
pkgver=3.0.2
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
sha512sums=('5fd58f2fcdf7d5e44c80fcd512681765f193608bdf190f6cd9ef15c7f4d6144b5a78208f1aea413b943f6f7416d461b0c08f713bd79b225bf1c1d0afee8d266d')

prepare(){
        bsdtar -xf gb-studio-linux-debian.deb
}

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/lib/gb-studio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/gb-studio/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYRIGHT"

}
