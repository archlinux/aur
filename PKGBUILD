# Maintainers: Théo Le Calvar <tlc@kher.nl>
pkgname=cecil-bin
pkgver=9.9.0
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
sha256sums=('c367ddc8a6e9a866a3397bfd1e23b0ded4549732de983ae0bd1c7c3bfc116ff3')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    cp "${srcdir}/${_pkgsrc_file}" "${pkgdir}/usr/bin/cecil"

    chmod 755 "${pkgdir}/usr"
    chmod +x "${pkgdir}/usr/bin/cecil"
}
