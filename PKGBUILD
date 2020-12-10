# Mantainer: Fabrizio Pietrucci <bamlessnty5@gmail.com>

_pkgname=spotitube
pkgname="${_pkgname}-bin"
provides=(spotitube)
pkgver=31
pkgrel=0
pkgdesc="Synchronize your Spotify collections downloading from external providers"
arch=('x86_64')
url="https://github.com/streambinder/spotitube"
license=('GPL3')
depends=('youtube-dl' 'ffmpeg' 'xdg-utils')

source=("https://github.com/streambinder/spotitube/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.bin"
        "https://raw.githubusercontent.com/streambinder/spotitube/master/LICENSE")
        
sha256sums=("be396e472e548de913f8e1de13d05b1d65e772657ddeb9fb752c628872ea3f2c"
            "SKIP")

package() {
	cd ${srcdir}
	install -Dm755 ${_pkgname}-v${pkgver}.bin ${pkgdir}/usr/bin/${_pkgname}
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
