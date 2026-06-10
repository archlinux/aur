# Maintainer: Deab22 <deab22 dot thermal577 at simplelogin dot com>
# Contributor: Matthew Spangler. <mattspangler at protonmail dot com>
# Contributor: Valentijn V. <neko at catgirlsin dot space>
pkgname=gb-studio-bin
_pkgname=GB-Studio
pkgver=4.3.0
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
sha512sums=('70a280388f9ee02e55114c965ed34dab13684cdf8d0523878a276c0a525ebce094bdbac182fec7700f3733e8bb3061ee83a2551be5ff47c34af65645bc9401da')

prepare(){
        bsdtar -xf ${pkgname}-${pkgver}-${pkgrel}.deb
}

package(){
	# Extract package data
	tar xf data.tar.zst -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/lib/gb-studio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/gb-studio/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYRIGHT"
}
