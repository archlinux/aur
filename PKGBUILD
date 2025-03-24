# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
_pkgname='chatterino2'
pkgname="${_pkgname}-bin"
provides=chatterino
conflicts=chatterino
pkgver=2.5.3
pkgrel=1
scdir=$_pkgname
_pkgver="${pkgver//_/-}"
_gitname="release-${_pkgver}"
pkgdesc="Second installment of the Twitch chat client series "Chatterino""
arch=('x86_64')
url="https://github.com/chatterino/chatterino2"
license=('MIT')
depends=('fuse2' 'icu70')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output'
            'gst-plugins-good: For audio output')
provides=(${_pkgname})
conflicts=(${_pkgname})
#source=(${_pkgname}.desktop)
source_x86_64=("${_pkgname}-${pkgver}_x64.deb::https://github.com/Chatterino/chatterino2/releases/download/v$pkgver/Chatterino-Ubuntu-22.04.deb")

package() {
	tar xf data.tar.zst -C "${pkgdir}"
	install -d "${pkgdir}/opt/${_pkgname}"
cd ..
	ln -sf "/opt/$_pkgname/$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
}
sha256sums_x86_64=('5c909edb3d8789627d0a313c730ce286b41275d3860d4543de08ae0643c2dcf9')
