pkgname=osu-fetch
pkgver=1.0.0
pkgrel=7
pkgdesc="A stylish fetch utility for osu! players"
arch=('any')
url="https://github.com/test2793/osu-fetch"
license=('MIT')
depends=('python' 'python-requests')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/test2793/osu-fetch/archive/refs/tags/v1.0.0.tar.gz"
        "osu-fetch.sh")
sha256sums=('8de106388615341c470c2bccaa572b3d2af0a5a0276a8892f2ccca0aca09997a'
            'a5dff6b37bebe2780ab8ae035db5b6baf4fadd63ca25242cbdc65542eadbb25b')

package() {
    install -d "${pkgdir}/usr/share/osu-fetch"
    install -d "${pkgdir}/usr/bin"

    # Ищем osufetch.py в папке src и копируем его, где бы он ни лежал
    find "${srcdir}" -name "osufetch.py" -exec install -m644 {} "${pkgdir}/usr/share/osu-fetch/osufetch.py" \;

    # Копируем bash-скрипт запуска
    install -m755 "${srcdir}/osu-fetch.sh" "${pkgdir}/usr/bin/osu-fetch"
}
