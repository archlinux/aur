# Maintainer: Deab22 <deab22 dot thermal577 at simplelogin dot com>
# Contributor: Matthew Spangler. <mattspangler at protonmail dot com>
# Contributor: Valentijn V. <neko at catgirlsin dot space>
pkgname=gb-studio-bin
_pkgname=GB-Studio
pkgver=3.2.1
pkgrel=2
pkgdesc="Visual retro game maker"
arch=('x86_64')
url="https://gbstudio.dev"
license=('MIT')
groups=()
replaces=('gb-studio')
provides=('gb-studio')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'util-linux' 'trash-cli')
optdepends=('pulseaudio: sound support')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver-$pkgrel.deb::https://github.com/chrismaltby/gb-studio/releases/download/v${pkgver}/gb-studio-linux-debian.deb")
sha512sums=('376babcecfd5b762221a379cbca0db148127ad7e29e9847771cc1b4b7d536d74de9a9389c769ad06376e1f0b59645edbf78469f83aef6433019308e1e9095e8f')

prepare(){
        bsdtar -xf ${pkgname}-${pkgver}-${pkgrel}.deb
}

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/lib/gb-studio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/gb-studio/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYRIGHT"
}
