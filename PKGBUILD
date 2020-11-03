# Mantainer: Fabrizio Pietrucci <bamlessnty5@gmail.com>

_pkgname=spotitube
pkgname="${_pkgname}-bin"
provides=(spotitube)
pkgver=30
pkgrel=1
pkgdesc="Synchronize your Spotify collections downloading from external providers"
arch=('x86_64')
url="https://github.com/streambinder/spotitube"
license=('GPL3')
depends=('youtube-dl' 'ffmpeg' 'xdg-utils')

source=("https://github.com/streambinder/spotitube/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.bin"
        "https://raw.githubusercontent.com/streambinder/spotitube/master/LICENSE")
        
sha256sums=("8eb24169e0c2e83661a720e97363dd5322385c4f064e50d987aee30169323d1f"
            "SKIP")

package() {
	cd ${srcdir}
	install -Dm755 ${_pkgname}-v${pkgver}.bin ${pkgdir}/usr/bin/${_pkgname}
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
