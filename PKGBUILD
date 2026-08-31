# Maintainers: Théo Le Calvar <tlc@kher.nl>
pkgname=cecil-bin
pkgver=9.0.2
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
sha256sums=('38b78fe174e922d8db6e9de75bd8ad99eeea813ff90d37b7d9954430e7bc818b')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    cp "${srcdir}/${_pkgsrc_file}" "${pkgdir}/usr/bin/cecil"

    chmod 755 "${pkgdir}/usr"
    chmod +x "${pkgdir}/usr/bin/cecil"
}
