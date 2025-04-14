# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
_pkgname='chatterino2-nightly'
pkgname="${_pkgname}-bin"
provides=(${_pkgname})
conflicts=(${_pkgname})
pkgver=2.5.3
pkgrel=1
scdir=$_pkgname
_pkgver="${pkgver//_/-}"
_gitname="release-${_pkgver}"
pkgdesc="Second installment of the Twitch chat client series "Chatterino""
arch=('x86_64')
url="https://github.com/chatterino/chatterino2"
license=('MIT')
depends=('icu70' 'libxkbcommon' 'libxkbcommon-x11' 'xcb-util-image' 'xcb-util-wm' 'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-renderutil' 'libnotify')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output'
            'gst-plugins-good: For audio output')
provides=chatterino
conflicts=chatterino
#source=(${_pkgname}.desktop)
source_x86_64=("${_pkgname}-${pkgver}_x64.deb::https://github.com/Chatterino/chatterino2/releases/download/nightly-build/Chatterino-Ubuntu-24.04-x86_64.deb")

package() {
	tar xf data.tar.zst -C "${pkgdir}"
	install -d "${pkgdir}/opt/${_pkgname}"

    install -dm755 "$pkgdir/usr/bin"
}

sha256sums_x86_64=('SKIP')
