# Maintainer: Deab22 <deab22 dot thermal577 at simplelogin dot com>
# Contributor: Matthew Spangler. <mattspangler at protonmail dot com>
# Contributor: Valentijn V. <neko at catgirlsin dot space>
pkgname=gb-studio-bin
_pkgname=GB-Studio
pkgver=4.3.2
pkgrel=0
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
sha512sums=('53ed1e2fa0c76dbf746d9fe75cf526ede8c94a2d990110f794dd2e9a7f86e801be31878dd08e2a8e37b36032cc05bb2f113752e7c3ce917721d57999ae699bad')

prepare(){
        bsdtar -xf ${pkgname}-${pkgver}-${pkgrel}.deb
}

package(){
	# Extract package data
	tar xf data.tar.zst -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/lib/gb-studio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/gb-studio/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYRIGHT"
}
