# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Westofer Raymond <westoferraymond@gmail.com>

pkgname=ytfzf
pkgver=2.4.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ytfzf/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('887cced6619f3d941f95c8b08c1446699951bb75f0e8c6eaf22d6992548d8f59')

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
