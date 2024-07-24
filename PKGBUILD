# Maintainer: Deab22 <deab22 dot thermal577 at simplelogin dot com>
# Contributor: Matthew Spangler. <mattspangler at protonmail dot com>
# Contributor: Valentijn V. <neko at catgirlsin dot space>
pkgname=gb-studio-bin
_pkgname=GB-Studio
pkgver=4.0.1
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
sha512sums=('f623ce73339445a71f9164607198b167fef53a9ff2c7829065bcde3b7b9dfcb123109481dd49df48e12edb4d56c9ca816b4d513bc2396cfc78253cbdaebd9a28')

prepare(){
        bsdtar -xf ${pkgname}-${pkgver}-${pkgrel}.deb
}

package(){
	# Extract package data
	tar xf data.tar.zst -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/lib/gb-studio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/gb-studio/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYRIGHT"
}
