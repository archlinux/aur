# Mantainer: Fabrizio Pietrucci <bamlessnty5@gmail.com>

_pkgname=spotitube
pkgname="${_pkgname}-bin"
provides=(spotitube)
pkgver=29
pkgrel=1
pkgdesc="Synchronize your Spotify collections downloading from external providers"
arch=('x86_64')
url="https://github.com/streambinder/spotitube"
license=('GPL3')
depends=('youtube-dl' 'ffmpeg' 'xdg-utils')

source=("https://github.com/streambinder/spotitube/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.bin"
        "https://raw.githubusercontent.com/streambinder/spotitube/master/LICENSE")
        
sha256sums=("4a0d034db781a9ce0038947fbef2a5b313604c13dc2cfc2e3184cac0f0c9915d"
            "SKIP")

package() {
	cd ${srcdir}
	install -Dm755 ${_pkgname}-v${pkgver}.bin ${pkgdir}/usr/bin/${_pkgname}
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
