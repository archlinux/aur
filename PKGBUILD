# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
_pkgname='chatterino2-nightly'
pkgname="${_pkgname}-bin"
provides=chatterino
conflicts=chatterino
pkgver=2.5.1
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
source_x86_64=("${_pkgname}-${pkgver}_x64.deb::https://github.com/chatterino/chatterino2/releases/download/nightly-build/Chatterino-Ubuntu-22.04-x86_64.deb")

package() {
	tar xf data.tar.zst -C "${pkgdir}"
	install -d "${pkgdir}/opt/${_pkgname}"
cd ..
	ln -sf "/opt/$_pkgname/$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
}
sha256sums_x86_64=('06dee15c0c321a45d1147c56f927ae48d6451a5182f61daf483e49beafab0d24')
