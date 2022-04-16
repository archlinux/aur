# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Westofer Raymond <westoferraymond@gmail.com>

pkgname=ytfzf
pkgver=2.3
pkgrel=1
pkgdesc="A posix script to find and watch youtube videos from the terminal. (Without API)"
arch=('any')
url="https://github.com/pystardust/ytfzf"
license=('GPL')
depends=('jq' 'curl' 'mpv')
makedepends=('make')
optdepends=(
    'yt-dlp:   for downloading'
    'dmenu:    use dmenu for search prompts and results'
    'rofi:     use rofi for search prompts and results'
    'fzf:      use fzf for results'
    'ueberzug: thumbnails image preview'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ytfzf/archive/v${pkgver}.tar.gz")
sha256sums=('09430d9ff4c64ecd0a0e5ff1c5ec31e4e989f7cf1f81986a1f8e72f83c77ef3f')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 ytfzf "${pkgdir}/usr/bin/ytfzf"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd docs
    install -dm0755 "${pkgdir}/usr/share/doc/${pkgname}"

    install -Dm644 man/${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
    install -Dm644 man/${pkgname}.5 "${pkgdir}/usr/share/man/man5/${pkgname}.5.gz"
    install -Dm644 conf.sh "${pkgdir}/usr/share/doc/${pkgname}"
}
