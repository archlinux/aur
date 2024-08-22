# Maintainer: Deab22 <deab22 dot thermal577 at simplelogin dot com>
# Contributor: Matthew Spangler. <mattspangler at protonmail dot com>
# Contributor: Valentijn V. <neko at catgirlsin dot space>
pkgname=gb-studio-bin
_pkgname=GB-Studio
pkgver=4.0.2
pkgrel=1
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
sha512sums=('f937571760d819d5eda4a971da406169cb4093a053565a59c7131a1465b4bd437587896bd107034cddd244df3e00f32764c2eaa4071e4385de05c856409878d2')

prepare(){
        bsdtar -xf ${pkgname}-${pkgver}-${pkgrel}.deb
}

package(){
	# Extract package data
	tar xf data.tar.zst -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/lib/gb-studio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/gb-studio/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYRIGHT"
}
