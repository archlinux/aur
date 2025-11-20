# Maintainers: Théo Le Calvar <tlc@kher.nl>
pkgname=cecil-bin
pkgver=8.72.3
pkgrel=1
pkgdesc="Static site generator"
url="https://cecil.app/"
arch=(any)
license=('mit')
depends=('php>=8.1' 'php-gd')
options=('!strip' 'staticlibs')
install='cecil-bin.install'

_pkgsrc_url="https://cecil.app/download/${pkgver}/cecil.phar"
_pkgsrc_file="cecil-${pkgver}.phar"

DLAGENTS=("https::/usr/bin/curl \
              -o %o \
              -H Referer:\ %u \
              ${_pkgsrc_url}"
)

source=("${_pkgsrc_file}"::"${_pkgsrc_url}")
sha256sums=('da215f60be81cc03b05c614b00189ba93368aee40d3ab05c4dd017facd3b1290')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    cp "${srcdir}/${_pkgsrc_file}" "${pkgdir}/usr/bin/cecil"

    chmod 755 "${pkgdir}/usr"
    chmod +x "${pkgdir}/usr/bin/cecil"
}
