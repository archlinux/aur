# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="nominatim-data-wikipedia"
pkgdesc="Optional Wikipedia data to use with nominatim"
url="https://nominatim.org"

pkgver=20190618
pkgrel=1

arch=("any")
license=("unknown")

depends=(
    "nominatim"
)

source=(
    "https://www.nominatim.org/data/wikipedia_article.sql.bin"
    "https://www.nominatim.org/data/wikipedia_redirect.sql.bin"
)
sha256sums=(
    "2043d9f91501e3e1ba9eab46c8d92dca826b3d21afd1f3f85eb2866614ba7d7a"
    "1dd3bf34cc1c2aac722269b30726bdfcb28ae523766b6839b26936937857b9ec"
)

package() {
    install -Dm644 -t "${pkgdir}/usr/share/webapps/nominatim/src/data/" \
        "${srcdir}/wikipedia_article.sql.bin" \
        "${srcdir}/wikipedia_redirect.sql.bin"
}
