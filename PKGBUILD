# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Westofer Raymond <westoferraymond@gmail.com>

pkgname=ytfzf
pkgver=1.2.0
pkgrel=2
pkgdesc="A posix script to find and watch youtube videos from the terminal. (Without API)"
arch=('any')
url="https://github.com/pystardust/ytfzf"
license=('GPL')
depends=('jq' 'mpv' 'youtube-dl')
makedepends=('make')
optdepends=(
    'dmenu: use dmenu for search prompts and results'
    'rofi:  use rofi for search prompts and results'
    'fzf:   use fzf for results'
    'ueberzug: thumbnails image preview'
)
source=("https://github.com/pystardust/ytfzf/archive/v${pkgver}.tar.gz")
sha256sums=('244205d59f4fbab30c87740b7181c387a1892e23d8e20a034adcfaa686130fa7')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
    
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd docs
    install -dm0755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 conf.sh INSTALL.md USAGE.md "${pkgdir}/usr/share/doc/${pkgname}"
    
}
